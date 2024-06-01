import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/constant/theme/app_themes.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';
import 'package:shopify_admin_dashboard/views/User/controller/UserController.dart';
import 'package:shopify_admin_dashboard/views/User/home-web/controller/homeweb_controller.dart';

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({super.key});

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  UserController userController = Get.find();
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
                Text(
                  'ElectroStock',
                  style: TextStyle(
                      fontFamily: 'NicoMoji',
                      color: AppTheme.grasGreenClr,
                      fontSize: Get.width * 0.013,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.5),
                  textAlign: TextAlign.center,
                ),
                //Cart and Profile Option
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: AppTheme.whiteselClr,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        backgroundColor: AppTheme.grasGreenClr,
                        child: Icon(
                          Icons.person,
                          color: AppTheme.whiteselClr,
                        ),
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
                            onTap: () {},
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 0),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
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
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return LoadingIndicator();
                              } else {
                                return Expanded(
                                  child: GridView.builder(
                                    itemCount: snapshot.data!.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 20,
                                            childAspectRatio: 1,
                                            mainAxisSpacing: 30),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          RxMap<String, int> product = {
                                            'productID':
                                                snapshot.data![index].productID,
                                            'quantity': 1
                                          }.obs;

                                          userController.cart.add(product);
                                        },
                                        child: Container(
                                          height: Get.width * 0.15,
                                          width: Get.width * 0.1,
                                          decoration: BoxDecoration(
                                              color: AppTheme.secondaryClr,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(9),
                                                    decoration: BoxDecoration(
                                                      color: (snapshot
                                                                  .data![index]
                                                                  .productStatus ==
                                                              'Available')
                                                          ? AppTheme
                                                              .grasGreenClr
                                                          : Colors.red.shade400,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      (snapshot.data![index]
                                                                  .productStatus ==
                                                              'Available')
                                                          ? 'In Stock'
                                                          : 'Out of Stock',
                                                      style: TextStyle(
                                                          color: AppTheme
                                                              .whiteselClr,
                                                          fontSize: Get.width *
                                                              0.008),
                                                    ),
                                                  )),
                                              Image.asset(
                                                "assets/images/${snapshot.data![index].productID}.png",
                                                height: Get.width * 0.07,
                                                width: Get.width * 0.07,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                '${snapshot.data![index].supplierName} ${snapshot.data![index].product}',
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize:
                                                        Get.width * 0.008),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                '\$${snapshot.data![index].price}',
                                                style: TextStyle(
                                                    color: AppTheme.whiteselClr,
                                                    fontSize:
                                                        Get.width * 0.008),
                                              ),
                                              const Spacer(),
                                              //add to cart button
                                              Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    height: Get.width * 0.025,
                                                    decoration: BoxDecoration(
                                                        color: AppTheme
                                                            .grasGreenClr,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Add to Cart',
                                                            style: TextStyle(
                                                                color: AppTheme
                                                                    .whiteselClr,
                                                                fontSize:
                                                                    Get.width *
                                                                        0.008),
                                                          ),
                                                          const SizedBox(
                                                              width: 5),
                                                          Icon(
                                                            Icons
                                                                .shopping_bag_outlined,
                                                            color: AppTheme
                                                                .whiteselClr,
                                                            size: Get.width *
                                                                0.008,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
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
