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
 ┃ ┃ ┃ ┃ ┣ 📂discriminator_model
 ┃ ┃ ┃ ┃ ┗ 📂generator_model
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