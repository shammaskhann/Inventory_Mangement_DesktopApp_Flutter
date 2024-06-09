import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/shared/phoneNumerInputFormatter.dart';
import 'package:shopify_admin_dashboard/views/Merchant/purchase%20order/purchase_order_screen.dart';
import 'package:shopify_admin_dashboard/views/User/controller/UserController.dart';
import 'package:shopify_admin_dashboard/views/components/CustomButton.dart';

class ProfileWebPage extends StatelessWidget {
  const ProfileWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    UserController userController = Get.find<UserController>();
    return Scaffold(
      backgroundColor: AppTheme.darkThemeBackgroudClr,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //E-Commerce WebPAge App Bar with Home Product Categories and on right most cart and profile option
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            color: AppTheme.darkThemeBackgroudClr,
            child: Row(
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
                //Cart and Profile Option
                Row(
                  children: [
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
                        // FocusedMenuItem(
                        // trailingIcon: const Icon(
                        //   Icons.person,
                        //   color: Colors.grey,
                        // ),
                        // title: const Text(
                        //   'Profile',
                        // ),
                        // onPressed: () {
                        //   Get.toNamed(PageName.profile_page);
                        // }),
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
          //Divider
          Container(
            height: 1,
            color: AppTheme.lightGreyClr,
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
                  'My Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.whiteselClr,
                      fontSize: Get.width * 0.02),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * 0.4,
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            style: const TextStyle(color: AppTheme.whiteselClr),
                            controller: userController.updateNameController,
                            decoration: const InputDecoration(
                              floatingLabelStyle:
                                  TextStyle(color: AppTheme.grasGreenClr),
                              labelText: 'Name',
                              labelStyle:
                                  TextStyle(color: AppTheme.whiteselClr),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.whiteselClr),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme
                                        .whiteselClr), // Set the enabled border color here
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.grasGreenClr),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(color: AppTheme.whiteselClr),
                            controller: userController.updateEmailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle:
                                  TextStyle(color: AppTheme.whiteselClr),
                              floatingLabelStyle:
                                  TextStyle(color: AppTheme.grasGreenClr),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.whiteselClr),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme
                                        .whiteselClr), // Set the enabled border color here
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.grasGreenClr),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //Passowrd
                          TextFormField(
                            style: const TextStyle(color: AppTheme.whiteselClr),
                            controller: userController.updatePasswordController,
                            decoration: const InputDecoration(
                              floatingLabelStyle:
                                  TextStyle(color: AppTheme.grasGreenClr),
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(color: AppTheme.whiteselClr),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.whiteselClr),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme
                                        .whiteselClr), // Set the enabled border color here
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.grasGreenClr),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(color: AppTheme.whiteselClr),
                            controller: userController.updateAddressController,
                            decoration: const InputDecoration(
                              floatingLabelStyle:
                                  TextStyle(color: AppTheme.grasGreenClr),
                              labelText: 'Address',
                              labelStyle:
                                  TextStyle(color: AppTheme.whiteselClr),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.whiteselClr),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme
                                        .whiteselClr), // Set the enabled border color here
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.grasGreenClr),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(color: AppTheme.whiteselClr),
                            controller: userController.updatePhoneNumController,
                            decoration: const InputDecoration(
                              floatingLabelStyle:
                                  TextStyle(color: AppTheme.grasGreenClr),
                              labelText: 'Phone Number',
                              labelStyle:
                                  TextStyle(color: AppTheme.whiteselClr),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.whiteselClr),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme
                                        .whiteselClr), // Set the enabled border color here
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.grasGreenClr),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              PhoneNumberFormatter.maskFormatter
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => CustomButton(
                      loading: userController.updateLoading.value,
                      title: 'UPDATE',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          userController.updateCustomer();
                        }
                      },
                      icon: const SizedBox()))
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Orders History',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.whiteselClr,
                          fontSize: Get.width * 0.02),
                    ),
                    const SizedBox(height: 20),
                    Container(
                        width: Get.width * 0.4,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: AppTheme.secondaryClr,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            //header specfic width orderDate ProductName Shipment Status
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Get.width * 0.1,
                                  child: Text(
                                    'Order Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.whiteselClr,
                                        fontSize: Get.width * 0.01),
                                  ),
                                ),
                                Container(
                                  width: Get.width * 0.1,
                                  child: Text(
                                    'Product Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.whiteselClr,
                                        fontSize: Get.width * 0.01),
                                  ),
                                ),
                                Container(
                                  width: Get.width * 0.1,
                                  child: Text(
                                    'Shipment Status',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.whiteselClr,
                                        fontSize: Get.width * 0.01),
                                  ),
                                ),
                              ],
                            ),

                            FutureBuilder(
                                future: userController.getCustomerHistory(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.data == null) {
                                    return const Center(
                                        child: Text('No Orders Found'));
                                  }
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: Get.width * 0.1,
                                                child: Text(
                                                  formatDate(
                                                      snapshot.data[index]
                                                          ['OrderDate']),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize:
                                                          Get.width * 0.01),
                                                ),
                                              ),
                                              Container(
                                                width: Get.width * 0.1,
                                                child: Text(
                                                  snapshot.data[index]['Name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize:
                                                          Get.width * 0.01),
                                                ),
                                              ),
                                              Container(
                                                width: Get.width * 0.1,
                                                child: Text(
                                                  snapshot.data[index]
                                                      ['CurrentStatus'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppTheme.whiteselClr,
                                                      fontSize:
                                                          Get.width * 0.01),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      );
                                    },
                                  );
                                }),
                          ],
                        )),
                  ]),
              const SizedBox()
            ],
          )
        ],
      ),
    );
  }
}
