// lib/features/home/presentation/providers/home_provider.dart
import 'package:flutter/material.dart';
import '../../data/repositories/slider_repository.dart';
import '../../data/models/slide_model.dart';
import '../../domain/usecases/home_slider_usecases.dart';

class SliderProvider with ChangeNotifier {
  final SliderRepository _repository = SliderRepository();
  late final GetSlidesUseCase _getSlidesUseCase = GetSlidesUseCase(_repository);

  List<SlideModel> _slides = [];
  bool _isLoading = false;
  String? _error;

  List<SlideModel> get slides => _slides;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchSlides() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _slides = await _getSlidesUseCase.execute();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}