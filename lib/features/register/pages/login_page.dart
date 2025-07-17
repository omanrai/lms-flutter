import 'package:flutter/material.dart';
import 'package:lms/core/widget/CustomInputField.dart';

import '../../../core/widget/Custom_Button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Fixed header (non-scrollable)
            ClipPath(
              clipper: TCustomCurvedEdges(),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        spacing: 8,

                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {},
                          ),
                          Spacer(),
                          Text(
                            "Don't have an account?",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: Colors.white),
                          ),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ), // Increase this value for more roundness
                              ),
                              backgroundColor: Color(0XFF908BFF),
                              // backgroundColor: Theme.of(
                              //   context,
                              // ).primaryColor.withOpacity(0.8),
                            ),
                            onPressed: () {},
                            child: Text("Get Started"),
                          ),
                        ],
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            "LMS",
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Scrollable content area
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Free forever. No credit card required",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  CustomInputField(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),

                  CustomInputField(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.password),
                  ),

                  CustomButton(label: "Login", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
      firstCurve.dx,
      firstCurve.dy,
      lastCurve.dx,
      lastCurve.dy,
    );

    final secondCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
      secondCurve.dx,
      secondCurve.dy,
      secondLastCurve.dx,
      secondLastCurve.dy,
    );

    final thirdCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
      thirdCurve.dx,
      thirdCurve.dy,
      thirdLastCurve.dx,
      thirdLastCurve.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
