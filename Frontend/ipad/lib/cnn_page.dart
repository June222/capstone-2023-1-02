import 'package:flutter/material.dart';

class cnnPage extends StatelessWidget {
  const cnnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          padding: const EdgeInsets.only(left: 50, top: 25), // 왼쪽 여백 설정
          alignment: Alignment.centerLeft,
          child: const Text(
            'CNN',
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
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
