import 'package:dartz/dartz.dart';
import '../../../../../../../../../../core/errors/failures.dart';
import '../models/pray_timing_model.dart';

abstract class TimingRepository {
  Future<Either<Failure, Data>> getPrayTiming();
}
