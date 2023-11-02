import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String flawNumber;

  const SecondPage(this.flawNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    String messagePath = "assets/defect1_message.png";
    String realImagePath = "assets/defect1_real.png";
    String fakeImagePath = "assets/defect1_fake.png";
    // flawNumber에 따라 다른 이미지 경로 생성
    if (flawNumber == "결함 2번") {
      messagePath = "assets/defect2_message.png";
      realImagePath = "assets/defect2_real.png";
      fakeImagePath = "assets/defect2_fake.png";
    }
    if (flawNumber == "결함 4번") {
      messagePath = "assets/defect4_message.png";
      realImagePath = "assets/defect4_real.png";
      fakeImagePath = "assets/defect4_fake.png";
    }

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          padding: const EdgeInsets.only(left: 50, top: 25), // 왼쪽 여백 설정
          alignment: Alignment.centerLeft,
          child: const Text(
            'DCGAN',
            style: TextStyle(
              color: Color.fromRGBO(17, 155, 255, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(17, 155, 255, 1),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬 설정
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        '📌 $flawNumber에 대한 이미지 생성결과',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        '      해상도 64x64',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    messagePath,
                    width: 300,
                    fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
                  ), // 이미지 파일의 경로
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InteractiveViewer(
                  child: Image.asset(
                    realImagePath,
                    width: 600, // 원하는 너비
                    height: 600, // 원하는 높이
                    fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
                  ),
                ),
                Image.asset(
                  'assets/arrow.png',
                  width: 100, // 원하는 너비
                  fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
                ),

                /// 이미지 파일의 경로
                InteractiveViewer(
                  child: Image.asset(
                    fakeImagePath,
                    width: 600, // 원하는 너비
                    height: 600, // 원하는 높이
                    fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    'Real 이미지',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(),
                  SizedBox(),
                  Text(
                    'fake 이미지',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(),
                ],
              ),
              if (flawNumber == "결함 4번")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      '      해상도 128x128',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InteractiveViewer(
                            child: Image.asset(
                              "assets/defect4_real_128.png",
                              width: 600, // 원하는 너비
                              height: 600, // 원하는 높이
                              fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
                            ),
                          ),
                          Image.asset(
                            'assets/arrow.png',
                            width: 100, // 원하는 너비
                            fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
                          ),

                          /// 이미지 파일의 경로
                          InteractiveViewer(
                            child: Image.asset(
                              "assets/defect4_fake_128.png",
                              width: 600, // 원하는 너비
                              height: 600, // 원하는 높이
                              fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text(
                          'Real 이미지',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(),
                        SizedBox(),
                        Text(
                          'fake 이미지',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
