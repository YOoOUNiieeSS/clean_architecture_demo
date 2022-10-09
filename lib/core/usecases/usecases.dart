import 'package:clean_architecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, NoParams> {
  Future<Either<Failure, Type>> call(NoParams params);
}



class NoParams extends Equatable{
  @override
  List<Object?> get props => [];

}