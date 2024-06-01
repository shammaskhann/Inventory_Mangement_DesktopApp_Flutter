import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/views/authentication/controller/AdminLoginController.dart';
import 'package:shopify_admin_dashboard/views/authentication/controller/login_controller.dart';
import 'package:shopify_admin_dashboard/views/components/action_button.dart';
import '../../../constant/theme/app_themes.dart';

class AdminLogIn extends StatefulWidget {
  final Function onSignUpSelected;

  AdminLogIn({required this.onSignUpSelected});

  @override
  _AdminLogInState createState() => _AdminLogInState();
}

class _AdminLogInState extends State<AdminLogIn> {
  AdminLoginController loginController = AdminLoginController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          shadowColor: Colors.black,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ADMIN LOG IN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 30,
                        child: const Divider(
                          color: AppTheme.kPrimaryColor,
                          thickness: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextField(
                        controller: loginController.emailController,
                        decoration: const InputDecoration(
                          // hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Obx(
                        () => TextField(
                          obscureText: !loginController.isPasswordVisible.value,
                          controller: loginController.passwordController,
                          decoration: InputDecoration(
                            // hintText: 'Password',
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              onTap: () {
                                loginController.isPasswordVisible.value =
                                    !loginController.isPasswordVisible.value;
                              },
                              child: (loginController.isPasswordVisible.value)
                                  ? const Icon(
                                      Icons.visibility,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      Obx(
                        () => actionButton(
                            "Log In", loginController.isLoading.value, () {
                          loginController.login();
                        }),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Login AS",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.onSignUpSelected();
                            },
                            child: const Row(
                              children: [
                                Text(
                                  "User",
                                  style: const TextStyle(
                                    color: AppTheme.kPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppTheme.kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
