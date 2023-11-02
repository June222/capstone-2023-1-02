import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('첫 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // '결함 1번' 버튼이 클릭되었을 때의 동작
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondPage('결함 1번')),
                );
              },
              child: const Text('결함 1번'),
            ),
            ElevatedButton(
              onPressed: () {
                // '결함 2번' 버튼이 클릭되었을 때의 동작
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondPage('결함 2번')),
                );
              },
              child: const Text('결함 2번'),
            ),
            ElevatedButton(
              onPressed: () {
                // '결함 3번' 버튼이 클릭되었을 때의 동작
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondPage('결함 4번')),
                );
              },
              child: const Text('결함 4번'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class SecondPage extends StatelessWidget {
  final String flawNumber;

  const SecondPage(this.flawNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          padding: const EdgeInsets.only(left: 50), // 왼쪽 여백 설정
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '📌 $flawNumber에 대한 이미지 생성결과',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(
              'assets/defect4_real.png',
              width: 200, // 원하는 너비
              height: 200, // 원하는 높이
              fit: BoxFit.cover, // 이미지가 지정한 크기에 맞게 조절되도록 함
            ), // 이미지 파일의 경로
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
