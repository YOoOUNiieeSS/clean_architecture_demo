import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/features/random_qoute/presentation/widgets/qoute_content.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatelessWidget {
  QuoteScreen({super.key});

  Widget _buildBody() => Column(
        children: [
          const QouteContent(),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: AppColors.primaryColor, shape: BoxShape.circle),
            child: const Icon(
              Icons.refresh,
              size: 28,
              color: Colors.white,
            ),
          )
        ],
      );
  final _buildAppar = AppBar(
    title: const Text(AppStrings.appName),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppar, body: _buildBody());
  }
}
