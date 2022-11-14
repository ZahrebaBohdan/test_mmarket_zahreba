import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:test_mmarket_zahreba/constants.dart';
import 'package:test_mmarket_zahreba/screens/home.dart';
import 'package:test_mmarket_zahreba/screens/password_recovery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Zahreba Bohdan',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmail(String input) => EmailValidator.validate(input);
  bool showSuffix = false;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.asset(
                'images/Rectangle25.png',
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Sign In',
                style: kTextStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Username', style: kTextStyle),
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffix: Container(
                      transform: Matrix4.translationValues(0, 10, 0),
                      child: const Icon(
                        Icons.done,
                        color: kPrimaryColor,
                      )),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return EmailValidator.validate(value!)
                      ? null
                      : "Enter a valid email";
                },
                textAlignVertical: TextAlignVertical.bottom,
                style: kInputTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Password', style: kTextStyle),
              ),
              TextField(
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                obscuringCharacter: '●',
                style: kInputTextStyle,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Container(
                      transform: Matrix4.translationValues(10, 5, 0.0),
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const HomeScreen()),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(293, 51)),
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    foregroundColor: MaterialStateProperty.all(
                      const Color(0xFFFFFFFF),
                    ),
                  ),
                  child: const Text(
                    'Sign in',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PasswordRecoveryScreen(),
                      ));
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: kPrimaryColor,
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
