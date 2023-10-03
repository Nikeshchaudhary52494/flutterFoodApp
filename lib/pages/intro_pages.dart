import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(
              'lib/images/spinach.png',
              width: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              // style: GoogleFonts.notoSerif(fontSize: 10)),
              style: GoogleFonts.notoSerif(fontSize: 40),
            ),
          ),
          const Text("Fresh items everyDay"),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            )),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Get Started",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
