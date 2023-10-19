import pandas as pd
import numpy as np
import os
import keras
from keras import backend as K
from keras.models import Model
from keras.layers import Input,Concatenate
from tensorflow.keras.layers import Conv2D, Conv2DTranspose
from tensorflow.keras.layers import MaxPooling2D
from keras.losses import binary_crossentropy
from tqdm import tqdm
import cv2
import requests
from flask_restful import reqparse, Resource

class DataGenerator(keras.utils.Sequence):
    'Generates data for Keras'
    def __init__(self, list_IDs, df, expand_image, target_df=None, mode='fit',
                 base_path='/home/yeojisu/mysite/file/defect-detection',
                 batch_size=32, dim=(256, 1600), n_channels=1,
                 n_classes=4, random_state=318, shuffle=True):
        self.dim = dim
        self.batch_size = batch_size
        self.df = df
        self.mode = mode
        self.base_path = base_path
        self.target_df = target_df
        self.list_IDs = list_IDs
        self.n_channels = n_channels
        self.n_classes = n_classes
        self.shuffle = shuffle
        self.random_state = random_state
        self.expand_image = expand_image

        self.on_epoch_end()

    def __len__(self):
        'Denotes the number of batches per epoch'
        return int(np.floor(len(self.list_IDs) / self.batch_size))

    def __getitem__(self, index):
        'Generate one batch of data'
        # Generate indexes of the batch
        indexes = self.indexes[index*self.batch_size:(index+1)*self.batch_size]

        # Find list of IDs
        list_IDs_batch = [self.list_IDs[k] for k in indexes]

        X = self.__generate_X(list_IDs_batch)

        if self.mode == 'fit':
            y = self.__generate_y(list_IDs_batch)
            return X, y

        elif self.mode == 'predict':
            return X

        else:
            raise AttributeError('The mode parameter should be set to "fit" or "predict".')

    def on_epoch_end(self):
        'Updates indexes after each epoch'
        self.indexes = np.arange(len(self.list_IDs))
        if self.shuffle == True:
            np.random.seed(self.random_state)
            np.random.shuffle(self.indexes)

    def __generate_X(self, list_IDs_batch):
        'Generates data containing batch_size samples'
        # Initialization
        X = np.empty((self.batch_size, *self.dim, self.n_channels))

        # Generate data
        for i, ID in enumerate(list_IDs_batch):
            # Store samples
            X[i,] = self.expand_image

        return X

    def __generate_y(self, list_IDs_batch):
        y = np.empty((self.batch_size, *self.dim, self.n_classes), dtype=int)

        for i, ID in enumerate(list_IDs_batch):
            im_name = self.df['ImageId'].iloc[ID]
            image_df = self.target_df[self.target_df['ImageId'] == im_name]

            rles = image_df['EncodedPixels'].values
            masks = build_masks(rles, input_shape=self.dim)

            y[i, ] = masks

        return y


def dice_coef(y_true, y_pred, smooth=1):
    y_true_f = K.flatten(y_true)
    y_pred_f = K.flatten(y_pred)
    intersection = K.sum(y_true_f * y_pred_f)
    return (2. * intersection + smooth) / (K.sum(y_true_f) + K.sum(y_pred_f) + smooth)

def dice_loss(y_true, y_pred):
    smooth = 1.
    y_true_f = K.cast(K.flatten(y_true), 'float32')
    y_pred_f = K.cast(K.flatten(y_pred), 'float32')
    intersection = y_true_f * y_pred_f
    score = (2. * K.sum(intersection) + smooth) / (K.sum(y_true_f) + K.sum(y_pred_f) + smooth)
    return 1. - score

def bce_dice_loss(y_true, y_pred):
    return binary_crossentropy(y_true, y_pred) + dice_loss(y_true, y_pred)

def build_model(input_shape):
    inputs = Input(input_shape)

    c1 = Conv2D(8, (3, 3), activation='elu', padding='same') (inputs)
    c1 = Conv2D(8, (3, 3), activation='elu', padding='same') (c1)
    p1 = MaxPooling2D((2, 2)) (c1)

    c2 = Conv2D(16, (3, 3), activation='elu', padding='same') (p1)
    c2 = Conv2D(16, (3, 3), activation='elu', padding='same') (c2)
    p2 = MaxPooling2D((2, 2)) (c2)

    c3 = Conv2D(32, (3, 3), activation='elu', padding='same') (p2)
    c3 = Conv2D(32, (3, 3), activation='elu', padding='same') (c3)
    p3 = MaxPooling2D((2, 2)) (c3)

    c4 = Conv2D(64, (3, 3), activation='elu', padding='same') (p3)
    c4 = Conv2D(64, (3, 3), activation='elu', padding='same') (c4)
    p4 = MaxPooling2D(pool_size=(2, 2)) (c4)

    c5 = Conv2D(64, (3, 3), activation='elu', padding='same') (p4)
    c5 = Conv2D(64, (3, 3), activation='elu', padding='same') (c5)
    p5 = MaxPooling2D(pool_size=(2, 2)) (c5)

    c55 = Conv2D(128, (3, 3), activation='elu', padding='same') (p5)
    c55 = Conv2D(128, (3, 3), activation='elu', padding='same') (c55)

    u6 = Conv2DTranspose(64, (2, 2), strides=(2, 2), padding='same') (c55)
    u6 = Concatenate()([u6, c5])
    c6 = Conv2D(64, (3, 3), activation='elu', padding='same') (u6)
    c6 = Conv2D(64, (3, 3), activation='elu', padding='same') (c6)

    u71 = Conv2DTranspose(64, (2, 2), strides=(2, 2), padding='same') (c6)
    u71 = Concatenate()([u71, c4])
    c71 = Conv2D(64, (3, 3), activation='elu', padding='same') (u71)
    c61 = Conv2D(64, (3, 3), activation='elu', padding='same') (c71)

    u7 = Conv2DTranspose(32, (2, 2), strides=(2, 2), padding='same') (c61)
    u7 = Concatenate()([u7, c3])
    c7 = Conv2D(32, (3, 3), activation='elu', padding='same') (u7)
    c7 = Conv2D(32, (3, 3), activation='elu', padding='same') (c7)

    u8 = Conv2DTranspose(16, (2, 2), strides=(2, 2), padding='same') (c7)
    u8 = Concatenate()([u8, c2])
    c8 = Conv2D(16, (3, 3), activation='elu', padding='same') (u8)
    c8 = Conv2D(16, (3, 3), activation='elu', padding='same') (c8)

    u9 = Conv2DTranspose(8, (2, 2), strides=(2, 2), padding='same') (c8)
    u9 = Concatenate()([u9, c1])
    c9 = Conv2D(8, (3, 3), activation='elu', padding='same') (u9)
    c9 = Conv2D(8, (3, 3), activation='elu', padding='same') (c9)

    outputs = Conv2D(4, (1, 1), activation='sigmoid') (c9)

    model = Model(inputs=[inputs], outputs=[outputs])
    model.compile(optimizer='adam', loss=bce_dice_loss, metrics=[dice_coef])

    return model

def make_mask(row_id, test_df):
    fname = test_df.iloc[row_id].name

    labels = test_df.iloc[row_id][:4]
    masks = np.zeros((256, 1600, 4), dtype=np.uint8)    # 4:class 1～4 (ch:0～3)

    for idx, label in enumerate(labels.values):
        if label is not np.nan:
            label = label.split(" ")
            positions = map(int, label[0::2])
            length = map(int, label[1::2])
            mask = np.zeros(256 * 1600, dtype=np.uint8)
            for pos, le in zip(positions, length):
                mask[pos:(pos + le)] = 255
            masks[:, :, idx] = mask.reshape(256, 1600, order='F')
    return fname, masks

def build_masks(rles, input_shape):
    depth = len(rles)
    height, width = input_shape
    masks = np.zeros((height, width, depth))

    for i, rle in enumerate(rles):
        if type(rle) is str:
            masks[:, :, i] = rle2mask(rle, (width, height))

    return masks

def build_rles(masks):
    width, height, depth = masks.shape

    rles = [mask2rle(masks[:, :, i])
            for i in range(depth)]

    return rles

def mask2rle(img):
    pixels= img.T.flatten()
    pixels = np.concatenate([[0], pixels, [0]])
    runs = np.where(pixels[1:] != pixels[:-1])[0] + 1
    runs[1::2] -= runs[::2]
    return ' '.join(str(x) for x in runs)

def rle2mask(mask_rle, shape=(256,1600)):
    s = mask_rle.split()
    starts, lengths = [np.asarray(x, dtype=int) for x in (s[0:][::2], s[1:][::2])]
    starts -= 1
    ends = starts + lengths
    img = np.zeros(shape[0]*shape[1], dtype=np.uint8)
    for lo, hi in zip(starts, ends):
        img[lo:hi] = 1
    return img.reshape(shape).T

palet = [(250, 230, 20), (30, 200, 241), (200, 30, 250), (250,60,20)]

class Detection(Resource):
    def post(self):
        model = build_model((256, 1600, 1))
        
        # 현재 file directory 내부 model-u-NetV5.h5에서 load 해오면 됨.
        model.load_weights('/home/yeojisu/mysite/file/defect-detection/model-u-NetV5.h5')

        parser = reqparse.RequestParser()
        parser.add_argument("image_url")
        args = parser.parse_args()
        argument = args["image_url"]

        # 외부 URL에서 이미지 가져오기
        image_data = requests.get(argument).content
        # 바이트 스트림으로부터 이미지 디코딩
        image_array = np.frombuffer(image_data, np.uint8)
        cv2_img = cv2.imdecode(image_array, cv2.IMREAD_COLOR)

        # 원래 사이즈
        height, width, _ = cv2_img.shape
        cv2_img = cv2.resize(cv2_img, (1600, 256))   # 원하는 크기로 리사이즈
        # 그레이스케일 변환
        my_img = cv2.cvtColor(cv2_img, cv2.COLOR_BGR2GRAY)
        my_img = my_img.astype(np.float32) / 255.
        my_img = np.expand_dims(my_img, axis=-1)


        image_path, image_name = os.path.split(argument)


        test_imgs = pd.DataFrame()
        test_imgs["ImageId"] = [image_name]

        sub_df = pd.DataFrame()
        sub_df["ImageId_ClassId"] = [image_name + "_1", image_name + "_2", image_name + "_3", image_name + "_4"]
        sub_df["EncodedPixels"] = [409600]*4
        sub_df['ImageId'] = [image_name]*4

        test_df = []
        batch_idx = [0]
        test_generator = DataGenerator(
            batch_idx,
            df=test_imgs,
            expand_image=my_img,
            shuffle=False,
            mode='predict',
            base_path=image_path,
            target_df=sub_df,
            batch_size=1,
            n_classes=4
        )
        batch_pred_masks = model.predict_generator(
            test_generator,
            workers=1,
            verbose=1,
            use_multiprocessing=False
        )
        for j, b in tqdm(enumerate(batch_idx)):
            filename = test_imgs['ImageId'].iloc[b]
            image_df = sub_df[sub_df['ImageId'] == filename].copy()
            pred_masks = batch_pred_masks[j, ].round().astype(int)
            pred_rles = build_rles(pred_masks)
            image_df['EncodedPixels'] = pred_rles
            test_df.append(image_df)
        test_df = pd.concat(test_df)
        test_df.loc[test_df['EncodedPixels'] == '', 'EncodedPixels'] = np.nan
        test_df.drop(columns='ImageId', inplace=True)

        # Transform class to column
        try:
            test_df['fname'], test_df['cls'] = zip(*test_df['ImageId_ClassId'].str.split('_'))
        except:
            test_df['fname'], test_df['cls'] = test_df['ImageId'], test_df['ClassId']

        test_df['cls'] = test_df['cls'].astype(int)
        test_df = test_df.pivot(index='fname',columns='cls',values='EncodedPixels')
        test_df['defects'] = test_df.count(axis=1)


        name, mask = make_mask(0, test_df)


        for ch in range(4):
            contours, _ = cv2.findContours(mask[:, :, ch],
                            cv2.RETR_LIST, cv2.CHAIN_APPROX_NONE)
            for i in range(0, len(contours)):
                cv2.polylines(cv2_img, contours[i], True, palet[ch], 8)

        cv2_img = cv2.cvtColor(cv2_img, cv2.COLOR_BGR2RGB)
        cv2_img = cv2.resize(cv2_img, (width, height))
        predicted_image_name = image_name.split(".")[0]+"_predicted.jpg"
        # 이미지 저장 
        save_path = "/home/yeojisu/mysite/file/defect-detection/image/"+ predicted_image_name
        cv2.imwrite(save_path, cv2_img)
        
        # 저장 후 URL로 변환하여 출력
        new_url = "https://yeojisu.pythonanywhere.com/image/"+predicted_image_name
        label = test_df.iloc[0].dropna().index.tolist()
        label.remove("defects")
        return {"image_url": new_url, "label": label}, 200
