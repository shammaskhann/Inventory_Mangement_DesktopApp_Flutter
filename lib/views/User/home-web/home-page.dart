import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/User/cart-screen/cart_page.dart';
import 'package:shopify_admin_dashboard/views/User/controller/UserController.dart';
import 'package:shopify_admin_dashboard/views/User/home-web/controller/homeweb_controller.dart';

import '../components/ProductCard.dart';

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({super.key});

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  //first check is controller availbe if not create
  UserController userController = Get.find<UserController>() ??
      Get.put(UserController()); //if not available create
  HomeWebController homeWebController = Get.put(HomeWebController());
  List<String> categories = [
    "Smartphones",
    "Laptops",
    "Tablets",
    "Smartwatches",
    "Headphones",
    "Cameras",
    "Televisions",
    "Gaming Consoles",
    "Smart Home Devices ",
    "Computer Accessories"
  ];
  List<String> icons = [
    "assets/icons/0.png",
    "assets/icons/1.png",
    "assets/icons/2.png",
    "assets/icons/3.png",
    "assets/icons/4.png",
    "assets/icons/5.png",
    "assets/icons/6.png",
    "assets/icons/7.png",
    "assets/icons/8.png",
    "assets/icons/9.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkThemeBackgroudClr,
      //E-Commerce WebPAge App Bar with Home Product Categories and on right most cart and profile option
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
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
                    homeWebController.selectedCategory.value = 0;
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
                    IconButton(
                      onPressed: () {
                        Get.toNamed(PageName.cart_page);
                      },
                      icon: Container(
                        width: Get.width * 0.02,
                        child: Stack(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: AppTheme.whiteselClr,
                              size: Get.width * 0.018,
                            ),
                            Obx(
                              () => (userController.cart.length > 0)
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
                                              child: Obx(() => Text(
                                                    '${userController.cart.length}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppTheme
                                                            .whiteselClr,
                                                        fontSize:
                                                            Get.width * 0.006),
                                                  )))))
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
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Categories Selection Area
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                      height: Get.height * 0.5,
                      width: Get.width * 0.15,
                      padding: const EdgeInsets.only(right: 20),
                      color: AppTheme.darkThemeBackgroudClr,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return HoverableListItem(
                            onTap: () {
                              homeWebController.selectedCategory.value =
                                  index + 1;
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    icons[index],
                                    height: Get.width * 0.013,
                                    width: Get.width * 0.013,
                                    color: AppTheme.whiteselClr,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    categories[index],
                                    style: TextStyle(
                                        color: AppTheme.whiteselClr,
                                        fontSize: Get.width * 0.008),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                ),
                //Divider
                Container(
                  height: Get.height * 0.5,
                  width: 1,
                  color: AppTheme.lightGreyClr,
                ),
                //Default Page
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: //Home Page
                      Obx(() {
                    if (homeWebController.selectedCategory.value == 0) {
                      return homePageWidget(userController, homeWebController);
                    } else {
                      return byCategoryPageWidget(
                          homeWebController.selectedCategory.value,
                          categories[
                              homeWebController.selectedCategory.value - 1],
                          homeWebController,
                          userController);
                    }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HoverableListItem extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  HoverableListItem({required this.onTap, required this.child});

  @override
  _HoverableListItemState createState() => _HoverableListItemState();
}

class _HoverableListItemState extends State<HoverableListItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: isHovering ? Colors.blue.withOpacity(0.7) : Colors.transparent,
          child: widget.child,
        ),
      ),
    );
  }
}

Widget homePageWidget(
    UserController userController, HomeWebController homeWebController) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
        child: SizedBox(
          height: Get.height * 0.45,
          width: Get.width * 0.7,
          child: Swiper(
            autoplay: true,
            autoplayDelay: 3000,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                "/assets/icons/carousel.png",
                fit: BoxFit.fill,
              );
            },
            pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                    color: AppTheme.whiteselClr,
                    activeColor: AppTheme.grasGreenClr)),
            control: const SwiperControl(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      Row(
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
            'Featured Products',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppTheme.whiteselClr,
                fontSize: Get.width * 0.02),
          ),
        ],
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: Get.width * 0.7,
        child: FutureBuilder(
            future: homeWebController.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndicator();
              } else {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                      mainAxisSpacing: 30),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: snapshot.data![index],
                      userController: userController,
                    );
                  },
                );
              }
            }),
      ),
    ],
  );
}

Widget byCategoryPageWidget(int index, String category,
    HomeWebController homeWebController, UserController userController) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      Row(
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
            category,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppTheme.whiteselClr,
                fontSize: Get.width * 0.02),
          ),
        ],
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: Get.width * 0.7,
        child: FutureBuilder(
            future: homeWebController.getProductByCat(index),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndicator();
              } else if (snapshot.data!.length == 0) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Text('No Products Available',
                        style: TextStyle(
                            color: AppTheme.whiteselClr,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                );
              } else {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                      mainAxisSpacing: 30),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: snapshot.data![index],
                      userController: userController,
                    );
                  },
                );
              }
            }),
      ),
    ],
  );
}
