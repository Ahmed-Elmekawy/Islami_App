import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/errors/failures.dart';
import '../models/azkar_model.dart';
import 'azkar_repository.dart';

class AzkarRepositoryImpl implements AzkarRepository {
  @override
  Future<Either<Failure, List<AzkarCategory>>> getAzkar() async {
    try {
      String jsonString = await rootBundle.loadString(
        'assets/azkar/azkar.json',
      );
      Map<String, dynamic> jsonResponse = json.decode(jsonString);
      AzkarModel azkarModel = AzkarModel.fromJson(jsonResponse);
      return Right(azkarModel.categories);
    } catch (error) {
      return const Left(UnknownFailure('Failed to load azkar data.'));
    }
  }
}



