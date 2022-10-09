import 'dart:convert';

import 'package:clean_architecture/core/api/end_points.dart';
import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/features/random_qoute/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  http.Client client;
  RandomQuoteRemoteDataSourceImpl({required this.client});
  @override
  Future<QuoteModel> getRandomQuote() async {
    final res = await client.get(Uri.parse(EndPoints.randomQuote),
        headers: {AppStrings.contentType:AppStrings.applicationJson});
    if (res.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(res.body));
    } else {
      throw ServerException();
    }
  }
}
