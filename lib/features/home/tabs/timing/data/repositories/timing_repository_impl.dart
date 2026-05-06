import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/errors/error_handler.dart';
import '../models/pray_timing_model.dart';
import 'timing_repository.dart';

class TimingRepositoryImpl implements TimingRepository {
  final Dio dio;

  TimingRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, Data>> getPrayTiming() async {
    try {
      String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      final response = await dio.get(
        "https://api.aladhan.com/v1/timingsByCity/$date",
        queryParameters: {"city": "cairo", "country": "egypt"},
      );

      if (response.statusCode == 200) {
        final model = PrayerTimingModel.fromJson(response.data);
        return Right(model.data);
      } else {
        return const Left(ServerFailure('Failed to load prayer timings'));
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}



