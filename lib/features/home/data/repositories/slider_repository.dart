// lib/features/home/data/repositories/slider_repository.dart
import 'package:dio/dio.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/api/api_constants.dart';
import '../models/slide_model.dart';

class SliderRepository {
  final DioClient _client = DioClient();

  Future<List<SlideModel>> getSlides() async {
    final response = await _client.dio.get(ApiConstants.slidesEndpoint);
    final results = response.data['data']['results'] as List;
    return results.map((json) => SlideModel.fromJson(json)).toList();
  }
}
