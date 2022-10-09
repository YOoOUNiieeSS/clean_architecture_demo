import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/core/utils/media_query.dart';

class QouteContent extends StatelessWidget {
  const QouteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      // width: context.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryColor),
      child: Column(
        children: [
          Text(
            'bla vsdc dcnsjkdcsdcnsd sdjkcnkdnc dcjnc eknc ask ack eckj cakdc eejkc ckzc akj ca ck ac ajk akc ekjc a  ',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "Mohamed Younies",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
