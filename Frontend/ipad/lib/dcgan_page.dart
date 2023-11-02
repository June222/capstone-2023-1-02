import 'package:flutter/material.dart';
import 'package:ipad/dcgan_widget.dart';

class DcganPage extends StatelessWidget {
  final String flawNumber;

  const DcganPage(this.flawNumber, {super.key});

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
      body: dcggan_widget(
          flawNumber: flawNumber,
          messagePath: messagePath,
          realImagePath: realImagePath,
          fakeImagePath: fakeImagePath),
      backgroundColor: Colors.black,
    );
  }
}
