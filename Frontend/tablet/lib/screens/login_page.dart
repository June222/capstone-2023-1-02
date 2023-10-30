// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sfp_mobile_interface_flutter/data/data.dart';
import 'package:sfp_mobile_interface_flutter/routers/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = '/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loadingBarOffstage = false;

  // 로그인 버튼 누를 시 1초 후 화면 전환
  void loginPressed() async {
    setState(() {
      loadingBarOffstage = true;
    });
    await Future.delayed(oneSec);
    setState(() {
      loadingBarOffstage = false;
    });
    // 화면을 추가로 넣지 않고 대체
    Navigator.pushReplacementNamed(context, MainPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // 현재 사용중인 기기의 렌더링 가능한 화면 크기를 받기
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "SMART FACTORY",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const SizedBox(height: 10),
              SizedBox(
                height: height / 10,
                width: width / 1.5,
                child: ElevatedButton(
                  onPressed: loginPressed,
                  child: loadingBarOffstage
                      // 로그인 버튼을 누르면 로딩 이미지로 대체
                      ? Visibility(
                          visible: loadingBarOffstage,
                          child: const CircularProgressIndicator(),
                        )
                      : const Text("관리자 모드로 시작"),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
