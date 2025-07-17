import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/widget/CustomInputField.dart';
import 'package:lms/features/login/presentation/bloc/login_bloc.dart';
import 'package:lms/l10n/app_localizations.dart';

import '../../../../core/widget/Custom_Button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final i10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                            i10n.loginTitle,
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: Colors.white),
                          ),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              backgroundColor: Color(0XFF908BFF),
                            ),
                            onPressed: () {},
                            child: Text(i10n.getStarted),
                          ),
                        ],
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            i10n.lmsTitle,
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
                    i10n.loginTitle,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    i10n.loginSubtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  BlocSelector<LoginBloc, LoginState, bool>(
                    selector: (state) {
                      return state is LoggingInState || state is LoginInitial;
                    },
                    builder: (context, shouldDisable) {
                      return CustomInputField(
                        labelText: i10n.loginTitle,
                        prefixIcon: const Icon(Icons.email),
                        readOnly: shouldDisable,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return i10n.required;
                          }
                          return null;
                        },
                      );
                    },
                  ),

                  BlocSelector<LoginBloc, LoginState, bool>(
                    selector: (state) {
                      return state is LoggingInState || state is LoginInitial;
                    },
                    builder: (context, shouldDisble) {
                      return CustomInputField(
                        labelText: i10n.passwordLabel,
                        prefixIcon: Icon(Icons.password),
                        readOnly: shouldDisble,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return i10n.required;
                          }
                          return null;
                        },
                      );
                    },
                  ),

                  CustomButton(
                    label: i10n.loginTitle,
                    onPressed: () {
                      if (_formKey.currentState?.validate() != true) return;
                    },
                  ),
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
