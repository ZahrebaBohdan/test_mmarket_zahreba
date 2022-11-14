import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Lottie.network(
                'https://assets10.lottiefiles.com/private_files/lf30_qam8tww4.json'),
          ),
          const Expanded(
            child: Text(
              'Signed In!',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 181, 78)),
            ),
          )
        ]),
      ),
    );
  }
}
