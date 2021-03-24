
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/provider/data_source.dart';

class ImageSlider extends StatelessWidget {

  DataSource _dataSource = DataSource();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CarouselSlider.builder(
        itemCount: _dataSource.products.length,
        itemBuilder: (BuildContext context, int itemIndex) => Container(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: _dataSource.products[itemIndex].images[itemIndex],
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fadeInCurve: Curves.easeIn,
              fadeOutDuration: Duration(milliseconds: 1000),
              fit: BoxFit.cover,
              height: 250,
            ),),
        ),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.15,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOut,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}