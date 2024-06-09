import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/views/User/checkout-page.dart/checkout_page.dart';
import 'package:shopify_admin_dashboard/views/components/CustomButton.dart';

import '../../../constant/theme/app_themes.dart';
import '../controller/UserController.dart';

class CartWebPage extends StatefulWidget {
  const CartWebPage({super.key});

  @override
  State<CartWebPage> createState() => _CartWebPageState();
}

class _CartWebPageState extends State<CartWebPage> {
  UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkThemeBackgroudClr,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            color: AppTheme.darkThemeBackgroudClr,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Home Product Categories
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(PageName.home_web_page);
                  },
                  child: Text(
                    'ElectroStock',
                    style: TextStyle(
                        fontFamily: 'NicoMoji',
                        color: AppTheme.grasGreenClr,
                        fontSize: Get.width * 0.013,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                //Cart and Profile Option
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SizedBox(
                        width: Get.width * 0.02,
                        child: Stack(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: AppTheme.whiteselClr,
                              size: Get.width * 0.018,
                            ),
                            Obx(
                              () => (userController.cart.isNotEmpty)
                                  ? Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                          height: Get.width * 0.01,
                                          width: Get.width * 0.01,
                                          decoration: const BoxDecoration(
                                              color: AppTheme.grasGreenClr,
                                              shape: BoxShape.circle),
                                          child: Center(
                                              child: Text(
                                            '${userController.cart.length}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.whiteselClr,
                                                fontSize: Get.width * 0.006),
                                          ))))
                                  : const SizedBox(),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    FocusedMenuHolder(
                      blurSize: 0,
                      onPressed: () {},
                      openWithTap: true,
                      menuWidth: Get.width * 0.1,
                      animateMenuItems: true,
                      menuOffset: 10,
                      bottomOffsetHeight: 100,
                      menuBoxDecoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      duration: const Duration(milliseconds: 100),
                      menuItems: [
                        FocusedMenuItem(
                            trailingIcon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            title: const Text(
                              'Profile',
                            ),
                            onPressed: () {
                              Get.toNamed(PageName.profile_page);
                            }),
                        FocusedMenuItem(
                            trailingIcon: const Icon(
                              Icons.logout,
                              color: Colors.grey,
                            ),
                            title: const Text(
                              'Log Out',
                              // style: TextStyle(
                              //     color: AppTheme.whiteselClr,
                              //     fontSize: Get.width * 0.008,
                              //     fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              userController.cart.clear();
                              Get.offAllNamed(PageName.auth_screen);
                            }),
                      ],
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppTheme.grasGreenClr,
                            child: Icon(
                              Icons.person,
                              color: AppTheme.whiteselClr,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            userController.userName,
                            style: TextStyle(
                                color: AppTheme.whiteselClr,
                                fontSize: Get.width * 0.008,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Diveder
          const Divider(
            color: AppTheme.grasGreenClr,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: Get.width * 0.03,
                  width: 20,
                  decoration: const BoxDecoration(
                      color: AppTheme.grasGreenClr,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                const SizedBox(width: 10),
                Text(
                  'My Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.whiteselClr,
                      fontSize: Get.width * 0.02),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          //Header of Cart Product Price Quantity Subtotal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Get.width * 0.2,
                  child: Text(
                    'Product',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.01),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width * 0.1,
                  child: Text(
                    'Price',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.01),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width * 0.1,
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.01),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width * 0.1,
                  child: Text(
                    'Subtotal',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.01),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: Get.width * 0.5,
            child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userController.cart.length,
                  itemBuilder: (context, index) {
                    if (userController.cart.isEmpty) {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: Text('No Product in Cart',
                            style: TextStyle(
                                color: AppTheme.whiteselClr,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ));
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryClr,
                            borderRadius: BorderRadius.circular(10),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color:
                            //           AppTheme.whiteselClr.withOpacity(0.2),
                            //       blurRadius: 10,
                            //       spreadRadius: 5)
                            // ]
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: Get.width * 0.2,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: AppTheme.darkThemeBackgroudClr,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: AppTheme.grasGreenClr
                                          //           .withOpacity(0.2),
                                          //       blurRadius: 10,
                                          //       spreadRadius: 5)
                                          // ]
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "assets/images/${userController.productInCart[index].productID}.png",
                                            height: Get.width * 0.04,
                                            width: Get.width * 0.04,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        userController
                                            .productInCart[index].product,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.whiteselClr,
                                            fontSize: Get.width * 0.01),
                                      ),
                                    ],
                                  )),
                              const Spacer(),
                              SizedBox(
                                width: Get.width * 0.1,
                                child: Text(
                                  '\$${userController.productInCart[index].price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.whiteselClr,
                                      fontSize: Get.width * 0.01),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: Get.width * 0.1,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppTheme.grasGreenClr),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GetBuilder<UserController>(
                                            init: userController,
                                            builder: (controller) {
                                              return Text(
                                                '${controller.getQuantity(userController.productInCart[index])}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppTheme.whiteselClr,
                                                    fontSize: Get.width * 0.01),
                                              );
                                            }),
                                        const SizedBox(width: 5),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 1,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                userController.increaseQuantity(
                                                    userController
                                                        .productInCart[index]);
                                              },
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_up_outlined,
                                                color: AppTheme.grasGreenClr,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                userController.decreaseQuantity(
                                                    userController
                                                        .productInCart[index]);
                                              },
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: AppTheme.grasGreenClr,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: Get.width * 0.1,
                                child: GetBuilder<UserController>(
                                    init: userController,
                                    builder: ((controller) {
                                      //make 2 digit after decima
                                      double price = userController
                                              .productInCart[index].price *
                                          userController.getQuantity(
                                              userController
                                                  .productInCart[index]);
                                      return Text(
                                        '\$${price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.whiteselClr,
                                            fontSize: Get.width * 0.01),
                                        textAlign: TextAlign.center,
                                      );
                                    })),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ),
          (userController.cart.isEmpty)
              ? const SizedBox()
              : Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: Get.width * 0.1,
                              child: Text(
                                'Total:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.01),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                              child: Obx(
                                () => Text(
                                  '\$${userController.totalPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.whiteselClr,
                                      fontSize: Get.width * 0.01),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CustomButton(
                                title: "Checkout",
                                onTap: () {
                                  Get.toNamed(PageName.checkout_page);
                                },
                                icon: const SizedBox()),
                          ),
                        )
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
