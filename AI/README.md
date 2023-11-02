### 학습 모델 개발
> 이번 연구의 핵심 "철강 불량 검출 및 분류 인공지능 학습 모델 개발" 레포지토리입니다. 

|항목|내용|
|------|------|
|데이터 분석 및 전처리|다양한 전처리 방법 시도<br>1. [V0. RLE 인코딩 값으로 mask 이미지 생성하여 폴더 저장](https://github.com/pnucse-capstone/capstone-2023-1-02/blob/main/AI/Data-preprocessing/data-preprocessing-V0.ipynb)<br>2. [V1. albumentation을 이용한 이미지 단순 증강](https://github.com/pnucse-capstone/capstone-2023-1-02/blob/main/AI/Data-preprocessing/data-preprocessing-V1.ipynb)<br>3. [V2. 다중 결함 제거하여 정보를 csv 파일로 저장](https://github.com/pnucse-capstone/capstone-2023-1-02/blob/main/AI/Data-preprocessing/data-preprocessing-V2.ipynb)<br>4. [V3. 결함 정보만 따로 crop한 후 2배 이하로 확대하여 저장](https://github.com/pnucse-capstone/capstone-2023-1-02/blob/main/AI/Data-preprocessing/data_preprocessing_V3.ipynb) 
|이미지 생성 모델|1. [DCGAN 모델](https://github.com/pnucse-capstone/capstone-2023-1-02/tree/main/AI/Image-Generation/DCGAN)<br>2. [PGGAN 모델](https://github.com/pnucse-capstone/capstone-2023-1-02/tree/main/AI/Image-Generation/PGGAN)|
|이미지 분류 모델|1. [CNN 모델](https://github.com/pnucse-capstone/capstone-2023-1-02/tree/main/AI/Image-Classification/CNN)<br> 2. [ResNet 모델](https://github.com/pnucse-capstone/capstone-2023-1-02/tree/main/AI/Image-Classification/ResNet) <br> 3. [EfficientNet 모델](https://github.com/pnucse-capstone/capstone-2023-1-02/tree/main/AI/Image-Classification/EfficientNet)|
|세그멘테이션 모델|1. [U-Net 모델](https://github.com/pnucse-capstone/capstone-2023-1-02/tree/main/AI/Semantic-Segmentation/U-Net)|
|Contributor|&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<img width = 150 src = "https://user-images.githubusercontent.com/76769044/277557064-ffdb114c-06e0-45fb-8fe6-9a3f06ee19d0.png" /> &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<img width = 150 src = "https://user-images.githubusercontent.com/76769044/277557691-0cf44abf-47ae-415f-a02b-a3507e564035.png"/><br>김태경 kimtg1997@pusan.ac.kr &#160;&#160;&#160;&#160;여지수 duwltn1301@pusan.ac.kr|

### AI 폴더 구조

```
📦AI
 ┣ 📂Data-preprocessing // 데이터 전처리 폴더 
 ┃ ┣ 📜data-preprocessing-V0.ipynb
 ┃ ┣ 📜data-preprocessing-V1.ipynb
 ┃ ┣ 📜data-preprocessing-V2.ipynb
 ┃ ┗ 📜data_preprocessing_V3.ipynb
 ┃
 ┣ 📂Image-Classification // 이미지 분류 학습 모델 폴더 
 ┃ ┣ 📂CNN
 ┃ ┣ 📂EfficientNet
 ┃ ┗ 📂ResNet
 ┃
 ┣ 📂Image-Generation // 이미지 생성 모델(GAN) 폴더 
 ┃ ┣ 📂DCGAN 
 ┃ ┃ ┣ 📂model
 ┃ ┃ ┗ 📂source-code
 ┃ ┃   ┣ 📜DCGAN_defect1.ipynb
 ┃ ┃   ┣ 📜DCGAN_defect2.ipynb
 ┃ ┃   ┗ 📜DCGAN_defect4.ipynb
 ┃ ┣ 📂PGGAN 
 ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┣ 📂16x16
 ┃ ┃ ┃ ┃ ┣ 📂discriminator_model
 ┃ ┃ ┃ ┃ ┗ 📂generator_model
 ┃ ┃ ┃ ┣ 📂32x32
 ┃ ┃ ┃ ┃ ┣ 📂discriminator_model
 ┃ ┃ ┃ ┃ ┗ 📂generator_model
 ┃ ┃ ┃ ┣ 📂4x4
 ┃ ┃ ┃ ┃ ┣ 📂discriminator_model
 ┃ ┃ ┃ ┃ ┗ 📂generator_model
 ┃ ┃ ┃ ┣ 📂64x64
 ┃ ┃ ┃ ┃ ┣ 📂discriminator_model
 ┃ ┃ ┃ ┃ ┗ 📂generator_model
 ┃ ┃ ┃ ┗ 📂8x8
 ┃ ┃ ┃   ┣ 📂discriminator_model
 ┃ ┃ ┃   ┗ 📂generator_model
 ┃ ┃ ┗ 📂source-code
 ┃ ┃   ┗ 📜PGGAN.ipynb
 ┃ ┗ 📜GAN_utils.ipynb
 ┃
 ┣ 📂Semantic-Segmentation // 이미지 불량 검출 모델 폴더 
 ┃ ┗ 📂U-Net
 ┃   ┣ 📜U-NetV1.ipynb
 ┃   ┗ 📜U-NetV2.ipynb
 ┗ 📜README.md
```