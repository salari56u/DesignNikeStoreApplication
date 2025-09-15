import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nike_store/screen/begin_screen.dart';
import 'package:nike_store/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool textShow = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F6FF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login Screen',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'welcome back nike store',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autocorrect: false,
                decoration: InputDecoration(
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
                  hintText: 'phone number',
                  hintStyle: const TextStyle(
                    color: Color(0XffB3B3B3),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: textShow,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (textShow) {
                            textShow = false;
                          } else {
                            textShow = true;
                          }
                        });
                      },
                      icon: textShow == true
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined)),
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
                  hintText: 'password',
                  hintStyle: const TextStyle(
                    color: Color(0XffB3B3B3),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: const Color(0xff2D96FF)),
                onPressed: () {},
                child: const Text("Forget passwors"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D96FF),
                    foregroundColor: const Color(0xffffffff),
                    fixedSize: const Size(double.maxFinite, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5))),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const BeginScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('dont have account?! '),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff2D96FF)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                    child: const Text("Create account"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
