import 'package:flutter_final/main.dart';
import 'package:flutter_final/screens/create_account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _service = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ลงชื่อเข้าใช้ Admin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: "อีเมล"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: "รหัสผ่าน"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                //call service.login
                //check result and open new screen
                onPressed: () async {
                  bool res = await _service.login(
                      _emailController.text, _passwordController.text);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: "รายการสินค้าทั้งหมด")));
                },
                child: const Text("เข้าสู่ระบบ")),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateAccountScreen()));
                },
                child: const Text("สร้างบัญชี >>"))
          ],
        ),
      ),
    );
  }
}
