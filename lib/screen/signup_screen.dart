import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FF),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign in Screen',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'welcome  nike store',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: _inputDecoration('user name'),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration('email'),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: _inputDecoration('phone number'),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: _inputDecoration('password'),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: _inputDecoration('confirm password'),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2D96FF),
                  foregroundColor: const Color(0xffffffff),
                  fixedSize: const Size(double.maxFinite, 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5))),
              onPressed: () {},
              child: const Text("Sign in"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('you have account ?!'),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff2D96FF)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Login"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xffD2D2D2),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff2D96FF),
          ),
          borderRadius: BorderRadius.circular(10)),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0XffB3B3B3),
      ),
    );
  }
}
