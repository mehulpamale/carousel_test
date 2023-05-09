import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: const MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  final aspectRatio = 1.33;
  final childWidthFactor = .8;
  final separatorSpacing = 8;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final itemWidth = deviceWidth * childWidthFactor - separatorSpacing;
    final itemHeight = itemWidth / aspectRatio;

    final carouselItemAspectRatio = itemWidth / itemHeight;

    return CarouselSlider.builder(
      itemCount: 2,
      itemBuilder: (context, index, _) => ColoredBox(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: separatorSpacing / 2),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Image.network(
              "https://dummyimage.com/400x300/",
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        height: itemHeight,
        aspectRatio: carouselItemAspectRatio,
        initialPage: 0,
        enlargeCenterPage: true,
        enlargeFactor: 0.38,
        viewportFraction: childWidthFactor,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
