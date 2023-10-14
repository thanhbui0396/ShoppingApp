import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/image_slider_providers.dart';

class SliderBody extends StatelessWidget {
  const SliderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return FutureBuilder(
      future: context.read<ImageSliderProviders>().getImagesSlider(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        var data = snapshot.data!;
        return data.isNotEmpty
            ? CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.8,
                  height: height / 5,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  autoPlay: true,
                ),
                items: List.generate(
                  data.length,
                  (index) => CachedNetworkImage(
                    imageUrl: data[index],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(13)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
