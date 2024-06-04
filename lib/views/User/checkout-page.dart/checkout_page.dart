import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/discount_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/giftcard_dropdown.dart';
import 'package:shopify_admin_dashboard/data/models/dropdowns/shipper_dropdown.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/views/User/controller/UserController.dart';
import 'package:shopify_admin_dashboard/views/components/CustomButton.dart';

class CheckoutScrenn extends StatelessWidget {
  const CheckoutScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
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
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: SizedBox(
                    //     width: Get.width * 0.02,
                    //     child: Stack(
                    //       children: [
                    //         Icon(
                    //           Icons.shopping_bag_outlined,
                    //           color: AppTheme.whiteselClr,
                    //           size: Get.width * 0.018,
                    //         ),
                    //         Obx(
                    //           () => (userController.cart.isNotEmpty)
                    //               ? Positioned(
                    //                   top: 0,
                    //                   right: 0,
                    //                   child: Container(
                    //                       height: Get.width * 0.01,
                    //                       width: Get.width * 0.01,
                    //                       decoration: const BoxDecoration(
                    //                           color: AppTheme.grasGreenClr,
                    //                           shape: BoxShape.circle),
                    //                       child: Center(
                    //                           child: Obx(() => Text(
                    //                                 '${userController.cart.length}',
                    //                                 style: TextStyle(
                    //                                     fontWeight:
                    //                                         FontWeight.bold,
                    //                                     color: AppTheme
                    //                                         .whiteselClr,
                    //                                     fontSize:
                    //                                         Get.width * 0.006),
                    //                               )))))
                    //               : const SizedBox(),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
                  'Checkout',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.whiteselClr,
                      fontSize: Get.width * 0.02),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: userController.cart.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: Get.width * 0.003,
            ),
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
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryClr,
                      borderRadius: BorderRadius.circular(10),
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/images/${userController.productInCart[index].productID}.png",
                                    height: Get.width * 0.04,
                                    width: Get.width * 0.04,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    userController.productInCart[index].product,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.whiteselClr,
                                        fontSize: Get.width * 0.01),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'x${userController.getQuantity(userController.productInCart[index])}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.whiteselClr,
                                        fontSize: Get.width * 0.01),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: Get.width * 0.1,
                          child: Text(
                            '\$${userController.productInCart[index].price * userController.getQuantity(userController.productInCart[index])}',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppTheme.whiteselClr,
                                fontSize: Get.width * 0.01),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),

          //Checkout Form (Dropdown for shipping selection & Payment Method)(Textfield for Address&phoneNumber(But will be fetched from uesrController)
          // Dropdown for gift cart and discount code
          Row(
            children: [
              //Dropdown for shipping selection
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TextField for Phone Number
                      Row(
                        children: [
                          Text(
                            'Phone Number',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppTheme.whiteselClr,
                                fontSize: Get.width * 0.011),
                          ),
                          const SizedBox(width: 10),
                          //Icon phone
                          Icon(
                            Icons.phone,
                            color: AppTheme.whiteselClr,
                            size: Get.width * 0.01,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: Get.width * 0.03,
                        decoration: BoxDecoration(
                            color: AppTheme.darkThemeBackgroudClr,
                            border: Border.all(color: AppTheme.grasGreenClr),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: TextField(
                          controller: userController.phoneNumController,
                          style: const TextStyle(color: AppTheme.whiteselClr),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: AppTheme.whiteselClr),
                              hintText: 'Enter your Phone Number'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //TextField for Address
                      Row(
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppTheme.whiteselClr,
                                fontSize: Get.width * 0.011),
                          ),
                          const SizedBox(width: 10),
                          //Icon Address
                          Icon(
                            Icons.location_on,
                            color: AppTheme.whiteselClr,
                            size: Get.width * 0.01,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: Get.width * 0.03,
                        decoration: BoxDecoration(
                            color: AppTheme.darkThemeBackgroudClr,
                            border: Border.all(color: AppTheme.grasGreenClr),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: TextField(
                          controller: userController.addressController,
                          style: const TextStyle(color: AppTheme.whiteselClr),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: AppTheme.whiteselClr),
                              hintText: 'Enter your Address'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Shipping Method',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.whiteselClr,
                            fontSize: Get.width * 0.011),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: Get.width * 0.03,
                        width: Get.width * 0.2,
                        decoration: BoxDecoration(
                            color: AppTheme.darkThemeBackgroudClr,
                            border: Border.all(color: AppTheme.grasGreenClr),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: AppTheme.darkThemeBackgroudClr,
                              value: userController.selectedShipperID.value == 0
                                  ? null
                                  : userController.selectedShipperID.value
                                      .toString(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: AppTheme.whiteselClr,
                              ),
                              iconSize: Get.width * 0.03,
                              elevation: 16,
                              style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.01),
                              underline: Container(
                                height: 0,
                                color: AppTheme.darkThemeBackgroudClr,
                              ),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  userController.selectedShipperID.value =
                                      int.parse(newValue);
                                }
                              },
                              items: userController.shipperDropDown
                                  .map<DropdownMenuItem<String>>(
                                    (ShipperDropDown item) =>
                                        DropdownMenuItem<String>(
                                      value: item.shipperID.toString(),
                                      child: Text(item.shipperName.toString()),
                                    ),
                                  )
                                  .toList(),
                              hint: Text(
                                'Select discount',
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.01,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //Dropdown for Payment Method
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //dropdown for discount code
                        Row(
                          children: [
                            Text(
                              'Discount Code',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.011),
                            ),
                            const SizedBox(width: 10),
                            //Icon Discount
                            Icon(
                              Icons.discount,
                              color: AppTheme.whiteselClr,
                              size: Get.width * 0.01,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),

                        //dropdown for discount code
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: Get.width * 0.03,
                          width: Get.width * 0.2,
                          decoration: BoxDecoration(
                            color: AppTheme.darkThemeBackgroudClr,
                            border: Border.all(color: AppTheme.grasGreenClr),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: AppTheme.darkThemeBackgroudClr,
                                value: userController
                                            .selectedDiscountID.value ==
                                        ''
                                    ? null
                                    : userController.selectedDiscountID.value
                                        .toString(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppTheme.whiteselClr,
                                ),
                                iconSize: Get.width * 0.03,
                                elevation: 16,
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.01,
                                ),
                                underline: Container(
                                  height: 0,
                                  color: AppTheme.darkThemeBackgroudClr,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    userController.selectedDiscountID.value =
                                        newValue;
                                  }
                                },
                                items: userController.discountDropDown
                                    .map<DropdownMenuItem<String>>(
                                      (DiscountDropDown item) =>
                                          DropdownMenuItem<String>(
                                        value: item.discountCode,
                                        child:
                                            Text(item.discountCode.toString()),
                                      ),
                                    )
                                    .toList(),
                                hint: Text(
                                  'Select discount',
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.01,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        //dropdown for gift card
                        Row(
                          children: [
                            Text(
                              'Gift Card',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.011),
                            ),
                            const SizedBox(width: 10),
                            //Icon Gift Card
                            Icon(
                              Icons.card_giftcard,
                              color: AppTheme.whiteselClr,
                              size: Get.width * 0.01,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: Get.width * 0.03,
                          width: Get.width * 0.2,
                          decoration: BoxDecoration(
                            color: AppTheme.darkThemeBackgroudClr,
                            border: Border.all(color: AppTheme.grasGreenClr),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: AppTheme.darkThemeBackgroudClr,
                                value:
                                    userController.selectedGiftCardID.value == 0
                                        ? null
                                        : userController
                                            .selectedGiftCardID.value
                                            .toString(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppTheme.whiteselClr,
                                ),
                                iconSize: Get.width * 0.03,
                                elevation: 16,
                                style: TextStyle(
                                  color: AppTheme.whiteselClr,
                                  fontSize: Get.width * 0.01,
                                ),
                                underline: Container(
                                  height: 0,
                                  color: AppTheme.darkThemeBackgroudClr,
                                ),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    userController.selectedGiftCardID.value =
                                        int.parse(newValue);
                                  }
                                },
                                items: userController.giftCardDropDown
                                    .map<DropdownMenuItem<String>>(
                                      (GiftCardDropDown item) =>
                                          DropdownMenuItem<String>(
                                        value: item.giftCardNumber.toString(),
                                        child: Text(
                                            item.giftCardNumber.toString()),
                                      ),
                                    )
                                    .toList(),
                                hint: Text(
                                  'Select discount',
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.01,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Payment Method',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppTheme.whiteselClr,
                              fontSize: Get.width * 0.011),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: Get.width * 0.03,
                          decoration: BoxDecoration(
                              color: AppTheme.darkThemeBackgroudClr,
                              border: Border.all(color: AppTheme.grasGreenClr),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: DropdownButton<String>(
                            dropdownColor: AppTheme.darkThemeBackgroudClr,
                            value: 'Credit Card',
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: AppTheme.whiteselClr,
                            ),
                            iconSize: Get.width * 0.03,
                            elevation: 16,
                            style: TextStyle(
                                color: AppTheme.whiteselClr,
                                fontSize: Get.width * 0.01),
                            underline: Container(
                              height: 0,
                              color: AppTheme.darkThemeBackgroudClr,
                            ),
                            onChanged: (String? newValue) {},
                            items: <String>[
                              'Credit Card',
                              'Debit Card',
                              'Cash on Delivery',
                              'Bank Transfer',
                              'Easy Paisa',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    )),
              ),
              //Button for Place Order
            ],
          ),
          const SizedBox(height: 60),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() => CustomButton(
                  icon: const SizedBox(),
                  loading: userController.orderLoading.value,
                  title: 'Confirm Order',
                  onTap: () {
                    userController.placeOrder();
                  },
                )),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
