import 'package:flutter/material.dart';
import 'package:ipad/cnn_page.dart';
import 'package:ipad/dcgan_page.dart';
import 'package:ipad/dcgan_widget.dart';
import 'package:ipad/stylegan_page.dart';
import 'package:ipad/stylegan_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50, top: 60, right: 50), // 왼쪽 여백 설정
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              '아래 버튼들을 클릭하여 결과를 확인해보세요! ☜',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '✔️ 결함 이미지 생성 모델',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/chart.png",
                      width: 300,
                      fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              '🐰 DCGAN  ➞',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // '결함 1번' 버튼이 클릭되었을 때의 동작
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DcganPage('결함 1번')),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '결함 1번',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // '결함 2번' 버튼이 클릭되었을 때의 동작
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DcganPage('결함 2번')),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '결함 2번',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // '결함 3번' 버튼이 클릭되었을 때의 동작
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DcganPage('결함 4번')),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '결함 4번',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // '결함 3번' 버튼이 클릭되었을 때의 동작
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const dcgan_all()),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '한눈에 🔍',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              '    🐰 StyleGAN  ➞',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // '결함 1번' 버튼이 클릭되었을 때의 동작
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const styleganPage('결함 1번')),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '결함 1번',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // '결함 2번' 버튼이 클릭되었을 때의 동작
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const styleganPage('결함 2번')),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '결함 2번',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // '결함 3번' 버튼이 클릭되었을 때의 동작
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const styleganPage('결함 4번')),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '결함 4번',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // '결함 3번' 버튼이 클릭되었을 때의 동작
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const stylegan_all()),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '한눈에 🔍',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  '✔️ 결함 분류 모델',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // '결함 1번' 버튼이 클릭되었을 때의 동작
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const cnnPage()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'CNN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class stylegan_all extends StatelessWidget {
  const stylegan_all({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          padding: const EdgeInsets.only(left: 50, top: 25), // 왼쪽 여백 설정
          alignment: Alignment.centerLeft,
          child: const Text(
            'StyleGAN',
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
      backgroundColor: Colors.black,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            stylegan_widget(
                flawNumber: '결함 1번',
                messagePath: "assets/defect1_message.png",
                realImagePath: "assets/defect1_real.png",
                fakeImagePath: "assets/defect1_fake_stylegan.png"),
            SizedBox(
              height: 50,
            ),
            stylegan_widget(
                flawNumber: '결함 2번',
                messagePath: "assets/defect2_message.png",
                realImagePath: "assets/defect2_real.png",
                fakeImagePath: "assets/defect2_fake_stylegan.png"),
            SizedBox(
              height: 50,
            ),
            stylegan_widget(
                flawNumber: '결함 4번',
                messagePath: "assets/defect4_message.png",
                realImagePath: "assets/defect4_real.png",
                fakeImagePath: "assets/defect4_fake_stylegan.png"),
          ],
        ),
      ),
    );
  }
}

class dcgan_all extends StatelessWidget {
  const dcgan_all({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.black,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            dcggan_widget(
                flawNumber: '결함 1번',
                messagePath: "assets/defect1_message.png",
                realImagePath: "assets/defect1_real.png",
                fakeImagePath: "assets/defect1_fake.png"),
            SizedBox(
              height: 50,
            ),
            dcggan_widget(
                flawNumber: '결함 2번',
                messagePath: "assets/defect2_message.png",
                realImagePath: "assets/defect2_real.png",
                fakeImagePath: "assets/defect2_fake.png"),
            SizedBox(
              height: 50,
            ),
            dcggan_widget(
                flawNumber: '결함 4번',
                messagePath: "assets/defect4_message.png",
                realImagePath: "assets/defect4_real.png",
                fakeImagePath: "assets/defect4_fake.png"),
          ],
        ),
      ),
    );
  }
}
