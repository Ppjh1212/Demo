import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:demo/token/views/root_tab.dart';
import 'package:demo/token/widgets/sub_title.dart';
import 'package:demo/token/widgets/text_form_field.dart';
import 'package:demo/token/widgets/title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userName = '';
  String userPassword = '';
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final emulatorIp = '10.0.2.2:3000';
    final simulatorIp = '127.0.0.1:3000';
    final ip = Platform.isIOS ? simulatorIp : emulatorIp;
    final storage = FlutterSecureStorage();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTitle(),
                const SizedBox(height: 16),
                CustomSubTitle(),
                Image.asset('assets/img/misc/logo.png'),
                CustomTextFormField(
                  hintText: '이메일을 입력해주세요',
                  onChanged: (value) {
                    userName = value;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요',
                  onChanged: (value) {
                    userPassword = value;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // final rawString = '$userName:$userPassword';
                    final rawString = 'test@codefactory.ai:testtest';
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    String token = stringToBase64.encode(rawString);
                    final resp = await dio.post(
                      'http://$ip/auth/login',
                      options: Options(
                        headers: {'Authorization': 'Basic $token'},
                      ),
                    );
                    final refreshToken = resp.data['refresh_token'];
                    final accessToken = resp.data['access_token'];

                    storage.write(key: 'REFRESH_TOKEN', value: refreshToken);
                    storage.write(key: 'ACCESS_TOKEN', value: accessToken);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RootTab(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF22A45D)),
                  child: Text('로그인'),
                ),
                TextButton(
                  onPressed: () async {
                    final represhToken =
                        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTc1NTEzOTQxNSwiZXhwIjoxNzU1MjI1ODE1fQ.dOoXl2UCy_fMBcP5kRwihHmtOhaz7iif6hDcI9Rdpmk';
                    final resp = await dio.post(
                      'http://$ip/auth/token',
                      options: Options(
                        headers: {'Authorization': 'Bearer $represhToken'},
                      ),
                    );
                    log(resp.data.toString());
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  child: Text('회원가입'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
