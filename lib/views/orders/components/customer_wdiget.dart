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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 65,
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(
              orderId,
              style: const TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(
              customer,
              style: const TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(
              product,
              style: const TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(
              date,
              style: const TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(
              status,
              style: TextStyle(
                  color: (status == 'Delivered')
                      ? Colors.greenAccent
                      : Colors.yellowAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(
              channel,
              style: const TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: width * 0.1,
            child: Text(
              total,
              style: const TextStyle(
                  color: AppTheme.whiteselClr,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: AppTheme.whiteselClr,
            ),
            onPressed: () {
              // Handle edit action
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: AppTheme.whiteselClr,
            ),
            onPressed: () {
              // Handle remove action
            },
          ),
        ],
      ),
    );
  }
}
