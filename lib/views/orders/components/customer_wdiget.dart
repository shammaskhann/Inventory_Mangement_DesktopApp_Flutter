import 'package:flutter/material.dart';

import '../../../constant/theme/app_themes.dart';

class CustomerWidget extends StatelessWidget {
  final String orderId;
  final String customer;
  final String product;
  final String quantity;
  final String date;
  final String status;
  final String channel;
  final String disountCode;
  final String giftCard;
  final String discountAmount;
  final String shipping;
  final String subTotal;
  final String total;
  final String paymentStatus;

  const CustomerWidget({
    Key? key,
    required this.orderId,
    required this.customer,
    required this.product,
    required this.quantity,
    required this.date,
    required this.status,
    required this.channel,
    required this.disountCode,
    required this.giftCard,
    required this.discountAmount,
    required this.shipping,
    required this.subTotal,
    required this.total,
    required this.paymentStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final text16Font = width * 0.008;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.05,
              child: Text(
                orderId,
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.07,
              child: Text(
                customer,
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product,
                    style: TextStyle(
                        color: AppTheme.whiteselClr,
                        fontSize: text16Font,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ' x$quantity',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: text16Font,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width * 0.05,
              child: Text(
                date,
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.07,
              child: Text(
                status,
                style: TextStyle(
                    color: (status == 'Processing')
                        ? Colors.yellowAccent
                        : (status == 'Shipped')
                            ? Colors.greenAccent
                            : Colors.redAccent,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.1,
              child: Text(
                channel,
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.05,
              child: Text(
                disountCode,
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.05,
              child: Text(
                (giftCard == 'null') ? 'N/A' : giftCard,
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.05,
              child: Text(
                "\$$subTotal",
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.05,
              child: Text(
                "\$$discountAmount",
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.05,
              child: Text(
                "\$$shipping",
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.05,
              child: Text(
                "\$$total",
                style: TextStyle(
                    color: AppTheme.whiteselClr,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width * 0.05,
              child: Text(
                paymentStatus,
                style: TextStyle(
                    color: (paymentStatus == 'Paid')
                        ? Colors.greenAccent
                        : Colors.yellowAccent,
                    fontSize: text16Font,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
