import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightGreenAccent, Colors.lightBlueAccent])),
        child: Column(
          children: [
            //logo
            Padding(
                padding: const EdgeInsets.only(
                    left: 60, right: 60, top: 80, bottom: 40),
                child: ClipOval(
                    child: Image.asset("lib/images/premier league.jpg"))),
            //we deliver groceries to your door step
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
              child: Text(
                "We deliver jerseys at your door step",
                style: GoogleFonts.kaushanScript(
                    fontSize: 43, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            const Spacer(),

            //get started button
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, '/home'),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 30),
                decoration: BoxDecoration(
                    color: Color(0xFF3a243b),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.ibmPlexSerif(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
