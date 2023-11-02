import 'package:flutter/material.dart';

class stylegan_widget extends StatelessWidget {
  const stylegan_widget({
    super.key,
    required this.flawNumber,
    required this.messagePath,
    required this.realImagePath,
    required this.fakeImagePath,
  });

  final String flawNumber;
  final String messagePath;
  final String realImagePath;
  final String fakeImagePath;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      '      해상도 256x156',
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
          ],
        ),
      ),
    );
  }
}
