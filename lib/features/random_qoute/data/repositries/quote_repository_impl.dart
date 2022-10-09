import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/network/network_info.dart';
import 'package:clean_architecture/features/random_qoute/data/data_sources/random_quote_local_data_source.dart';
import 'package:clean_architecture/features/random_qoute/data/data_sources/random_quote_remote_data_source.dart';
import 'package:clean_architecture/features/random_qoute/domain_layer/entities/quote.dart';
import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/random_qoute/domain_layer/repositries/quote_repository.dart';
import 'package:dartz/dartz.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  QuoteRepositoryImpl(
      {required this.networkInfo,
      required this.randomQuoteLocalDataSource,
      required this.randomQuoteRemoteDataSource});
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDataSource =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteDataSource);
        return Right(remoteDataSource);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localDataSource =
            await randomQuoteRemoteDataSource.getRandomQuote();
        return Right(localDataSource);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
