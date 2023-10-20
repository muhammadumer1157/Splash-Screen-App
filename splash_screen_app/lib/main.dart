import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splash_screen_app/animations/fade_animation.dart';
import 'package:splash_screen_app/login_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const LoginPage(),
                  ));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(
                delay: 1,
                child: Container(
                  width: width,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/one.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                delay: 1.3,
                child: Container(
                  width: width,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/one.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                delay: 1.6,
                child: Container(
                  width: width,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/one.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FadeAnimation(
                    delay: 1,
                    child: Text(
                      "Welcome",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  FadeAnimation(
                    delay: 1.3,
                    child: Text(
                      "We promis that you'll have the most \nfuss-free time with us ever.",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), height: 1.4),
                    ),
                  ),
                  const SizedBox(
                    height: 180.0,
                  ),
                  FadeAnimation(
                    delay: 1.6,
                    child: AnimatedBuilder(
                      animation: _scaleController,
                      builder: (context, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _widthController,
                            builder: (context, child) => Container(
                              width: _widthAnimation.value,
                              height: 80.0,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.blue.withOpacity(0.4)),
                              child: InkWell(
                                onTap: () {
                                  _scaleController.forward();
                                },
                                child: Stack(
                                  children: [
                                    AnimatedBuilder(
                                      animation: _positionController,
                                      builder: (context, child) => Positioned(
                                        left: _positionAnimation.value,
                                        child: AnimatedBuilder(
                                          animation: _scale2Controller,
                                          builder: (context, child) =>
                                              Transform.scale(
                                            scale: _scale2Animation.value,
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.blue),
                                              child: hideIcon == false
                                                  ? const Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                    )
                                                  : Container(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
