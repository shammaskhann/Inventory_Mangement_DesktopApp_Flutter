import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/views/authentication/controller/singup_controller.dart';
import 'package:shopify_admin_dashboard/shared/phoneNumerInputFormatter.dart';
import 'package:shopify_admin_dashboard/views/components/action_button.dart';

import '../../../constant/theme/app_themes.dart';

class SignUp extends StatefulWidget {
  final Function onLogInSelected;

  SignUp({required this.onLogInSelected});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignupController signupController = SignupController();
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
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SIGN UP",
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
                        height: 20,
                      ),
                      TextField(
                        controller: signupController.usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          suffixIcon: Icon(
                            Icons.person_outline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: signupController.emailController,
                        decoration: const InputDecoration(
                          // hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => TextField(
                          obscureText:
                              !signupController.isPasswordVisible.value,
                          controller: signupController.passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              onTap: () {
                                signupController.isPasswordVisible.value =
                                    !signupController.isPasswordVisible.value;
                              },
                              child: (signupController.isPasswordVisible.value)
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
                      //phone number with formatter
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: signupController.phoneNumController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          PhoneNumberFormatter.maskFormatter
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          suffixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: signupController.addressController,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          suffixIcon: Icon(
                            Icons.location_on_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Obx(
                        () => actionButton(
                            "Create Account", signupController.isLoading.value,
                            () {
                          signupController.signup();
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
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
                              widget.onLogInSelected();
                            },
                            child: const Row(
                              children: [
                                Text(
                                  "Log In",
                                  style: TextStyle(
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
