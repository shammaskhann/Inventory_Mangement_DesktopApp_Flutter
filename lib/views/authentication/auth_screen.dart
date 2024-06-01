import 'package:flutter/material.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/views/authentication/components/admin_login.dart';
import 'package:shopify_admin_dashboard/views/authentication/components/login.dart';
import 'package:shopify_admin_dashboard/views/authentication/components/signuo.dart';

enum Option { LogIn, SignUp, AdminLogIn }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Option selectedOption = Option.LogIn;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print(size.height);
    print(size.width);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: AppTheme.kPrimaryColor,
                ),
                Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Colors.white),
              ],
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  "Welcome to Electro Stocks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up to get started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Get access to all our products",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Padding(
            //     padding: EdgeInsets.all(32),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.keyboard_arrow_left,
            //           color: Colors.white,
            //           size: 28,
            //         ),
            //         SizedBox(
            //           width: 8,
            //         ),
            //         Text(
            //           "HOME",
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 16,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Icon(
                  Icons.menu,
                  color: AppTheme.kPrimaryColor,
                  size: 28,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.copyright,
                      color: Colors.grey,
                      size: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Copyright 2024 :) ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),

              //Animation 1
              transitionBuilder: (widget, animation) => RotationTransition(
                turns: animation,
                child: widget,
              ),
              switchOutCurve: Curves.easeInOutCubic,
              switchInCurve: Curves.fastLinearToSlowEaseIn,

              // //Animation 2
              // transitionBuilder: (widget, animation) =>
              //     ScaleTransition(child: widget, scale: animation),

              child: selectedOption == Option.LogIn
                  ? LogIn(
                      onAdminLogInSelected: () {
                        setState(() {
                          selectedOption = Option.AdminLogIn;
                        });
                      },
                      onSignUpSelected: () {
                        setState(() {
                          selectedOption = Option.SignUp;
                        });
                      },
                    )
                  : (selectedOption == Option.SignUp)
                      ? SignUp(
                          onLogInSelected: () {
                            setState(() {
                              selectedOption = Option.LogIn;
                            });
                          },
                        )
                      : AdminLogIn(
                          onSignUpSelected: () {
                            setState(() {
                              selectedOption = Option.LogIn;
                            });
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
