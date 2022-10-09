import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/random_qoute/domain_layer/entities/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
