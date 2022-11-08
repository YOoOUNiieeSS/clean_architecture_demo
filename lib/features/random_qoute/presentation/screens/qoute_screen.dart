import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/features/random_qoute/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_architecture/features/random_qoute/presentation/cubit/random_quote_states.dart';
import 'package:clean_architecture/features/random_qoute/presentation/widgets/qoute_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/core/widgets/error_widget.dart' as er;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuoteScreen extends StatefulWidget {
  QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  // @override
  // void initState() {
  //   _getRandomQuote();
  //   super.initState();
  // }

  Widget _buildBody() => BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
          builder: (context, state) {
        if (state is RandomQuoteIsLoadingState) {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
            ),
          );
        } else if (state is RandomQuoteLoadedState) {
          return Column(
            children: [
              QouteContent(quote: state.quote),
              InkWell(
                onTap: () => _getRandomQuote(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.refresh,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        } else if (state is RandomQuoteErrorState) {
          return const er.ErrorWidget();
        } else {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
            ),
          );
        }
      });

  final _buildAppar = AppBar(
    title: const Text(AppStrings.appName),
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => _getRandomQuote(),
        child: Scaffold(appBar: _buildAppar, body: _buildBody()));
  }
}
