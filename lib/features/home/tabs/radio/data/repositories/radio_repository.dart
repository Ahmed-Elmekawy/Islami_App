import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failures.dart';
import '../models/radio_model.dart';
import '../models/reciter_model.dart';

abstract class RadioRepository {
  Future<Either<Failure, List<RadioModel>>> getRadios();
  Future<Either<Failure, List<ReciterModel>>> getReciters();
}



