import 'package:clean_architecture/core/api/api_consumer.dart';
import 'package:clean_architecture/core/api/end_points.dart';
import 'package:clean_architecture/features/random_qoute/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<QuoteModel> getRandomQuote() async {
    final res = await apiConsumer.get(
      path: EndPoints.randomQuote,
    );
    return QuoteModel.fromJson(res);
  }
}
