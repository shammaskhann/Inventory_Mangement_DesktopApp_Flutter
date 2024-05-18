import 'package:flutter/material.dart';

import '../../../constant/theme/app_themes.dart';

class CustomerWidget extends StatelessWidget {
  final String orderId;
  final String customer;
  final String product;
  final String date;
  final String status;
  final String channel;
  final String total;

  const CustomerWidget({
    Key? key,
    required this.orderId,
    required this.customer,
    required this.product,
    required this.date,
    required this.status,
    required this.channel,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final text16Font = width * 0.009;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.01,
          ),
          SizedBox(
            width: width * 0.07,
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
            width: width * 0.1,
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
            width: width * 0.1,
            child: Text(
              product,
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: text16Font,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.1,
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
            width: width * 0.1,
            child: Text(
              status,
              style: TextStyle(
                  color: (status == 'Delivered')
                      ? Colors.greenAccent
                      : (status == 'Out for Delivery')
                          ? Colors.blueAccent
                          : Colors.yellowAccent,
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
            width: width * 0.1,
            child: Text(
              total,
              style: TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: text16Font,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: AppTheme.whiteselClr,
                  size: width * 0.012,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: AppTheme.whiteselClr,
                  size: width * 0.012,
                ),
              ),
              SizedBox(
                width: width * 0.005,
              )
            ],
          )
        ],
      ),
    );
  }
}
