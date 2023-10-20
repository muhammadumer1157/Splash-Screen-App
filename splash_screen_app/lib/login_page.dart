import 'package:flutter/material.dart';
import 'package:splash_screen_app/animations/fade_animation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeAnimation(
              delay: 1.2,
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            FadeAnimation(
              delay: 1.5,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[300]!))),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.8)),
                            hintText: "Email or Phone Number"),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.8)),
                          hintText: "Password"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            FadeAnimation(
                delay: 1.8,
                child: Center(
                  child: Container(
                    width: 120.0,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue[800]),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
