import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/errors/error_handler.dart';
import '../models/radio_model.dart';
import '../models/reciter_model.dart';
import 'radio_repository.dart';

class RadioRepositoryImpl implements RadioRepository {
  final Dio dio;

  RadioRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, List<RadioModel>>> getRadios() async {
    try {
      final response = await dio.get('https://www.mp3quran.net/api/v3/radios');
      
      if (response.data == null || response.data['radios'] == null) {
        return const Left(ServerFailure('Invalid response from server'));
      }

      final radiosList = (response.data['radios'] as List)
          .map((e) => RadioModel.fromJson(e))
          .toList();
      return Right(radiosList);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ReciterModel>>> getReciters() async {
    try {
      final response = await dio.get('https://www.mp3quran.net/api/v3/reciters');
      
      if (response.data == null || response.data['reciters'] == null) {
        return const Left(ServerFailure('Invalid response from server'));
      }

      final recitersList = (response.data['reciters'] as List)
          .map((e) => ReciterModel.fromJson(e))
          .toList();
      return Right(recitersList);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}



