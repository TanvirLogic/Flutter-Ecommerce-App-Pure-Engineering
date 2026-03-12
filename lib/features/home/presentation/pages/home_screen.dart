// lib/features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_instabuy_app/features/home/presentation/providers/slide_provider.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger slides fetch when screen loads
    Future.microtask(
      () => Provider.of<SliderProvider>(context, listen: false).fetchSlides(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<SliderProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("E-Commerce Home")),
      body: Column(
        children: [
          Center(
            child: homeProvider.isLoading
                ? const CircularProgressIndicator()
                : homeProvider.error != null
                ? Text(
                    homeProvider.error!,
                    style: const TextStyle(color: Colors.red),
                  )
                : homeProvider.slides.isNotEmpty
                ? CarouselSlider(
                    options: CarouselOptions(
                      height: 220,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                    ),
                    items: homeProvider.slides.map((slide) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    slide.photoUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    slide.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  )
                : const Text("No slides available"),
          ),
        ],
      ),
    );
  }
}
