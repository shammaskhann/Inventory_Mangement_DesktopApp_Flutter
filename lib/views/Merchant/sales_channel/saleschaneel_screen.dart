import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/views/Merchant/sales_channel/controller/saleschannel_controller.dart';
import '../../../constant/theme/app_themes.dart';
import '../../components/tag_container.dart';
import 'package:shopify_admin_dashboard/shared/loading_indicator.dart';

class SalesChannelScreen extends StatelessWidget {
  const SalesChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SalesChannelController salesChannelController =
        Get.put(SalesChannelController());
    return Container(
      color: AppTheme.darkThemeBackgroudClr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Channel',
              style: TextStyle(
                color: AppTheme.whiteselClr,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                CustomTagContainer(
                  iconData: Icons.list,
                  text: 'Sales Channel List',
                ),
                SizedBox(width: 10),
                CustomTagContainer(
                  iconData: Icons.history,
                  text: 'History',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //Headers
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: Get.width * 0.8,
              color: AppTheme.secondaryClr,
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'Channel ID',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Channel Name',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.07,
                    child: Text(
                      'Channel Type',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.12,
                    child: Text(
                      'Location',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.15,
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                    child: Text(
                      'Opertaion Hours',
                      style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: Get.width * 0.008,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: salesChannelController.getSalesChannel(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      height: Get.height * 0.5,
                      child: Center(child: LoadingIndicator()));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: Get.width * 0.8,
                          color: index.isEven
                              ? AppTheme.darkThemeBackgroudClr
                              : AppTheme.secondaryClr,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.07,
                                child: Text(
                                  snapshot.data![index].channelID.toString(),
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.1,
                                child: Text(
                                  snapshot.data![index].name,
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.07,
                                child: Text(
                                  snapshot.data![index].type,
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.12,
                                child: Text(
                                  snapshot.data![index].location ?? 'null',
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Text(
                                  snapshot.data![index].contactDetails,
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.1,
                                child: Text(
                                  snapshot.data![index].operatingHours,
                                  style: TextStyle(
                                    color: AppTheme.whiteselClr,
                                    fontSize: Get.width * 0.008,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
