import 'package:flutter/material.dart';

class CnnPage extends StatelessWidget {
  const CnnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          padding: const EdgeInsets.only(left: 50, top: 25), // 왼쪽 여백 설정
          alignment: Alignment.centerLeft,
          child: const Text(
            '흐 름 도',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset("assets/flow.png"),
              const SizedBox(
                height: 100,
              ),
              const Text(
                '  분류 모델별 성능 비교',
                style: TextStyle(
                  color: Color.fromRGBO(17, 155, 255, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/result.png",
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
