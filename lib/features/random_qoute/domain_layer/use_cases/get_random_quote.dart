import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecases/usecases.dart';
import 'package:clean_architecture/features/random_qoute/domain_layer/entities/quote.dart';
import 'package:clean_architecture/features/random_qoute/domain_layer/repositries/quote_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;
  const GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(params) =>
      quoteRepository.getRandomQuote();
}
