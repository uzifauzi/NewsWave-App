import 'package:dartz/dartz.dart';
import 'package:newswave_app/core/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call({Params params});
}
