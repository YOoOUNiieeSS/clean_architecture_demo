import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/features/random_qoute/domain_layer/entities/quote.dart';
import 'package:flutter/material.dart';

class QouteContent extends StatelessWidget {
  const QouteContent({super.key,required this.quote});
  final Quote quote;
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
            quote.content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              quote.author,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
