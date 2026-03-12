// lib/features/home/domain/usecases/get_slides_usecase.dart
import '../../data/repositories/slider_repository.dart';
import '../../data/models/slide_model.dart';

class GetSlidesUseCase {
  final SliderRepository repository;

  GetSlidesUseCase(this.repository);

  Future<List<SlideModel>> execute() async {
    return await repository.getSlides();
  }
}
