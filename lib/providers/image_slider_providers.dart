import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ImageSliderProviders extends ChangeNotifier {
  List listImage = [];
  Future<List> getImagesSlider() async {
    const url = 'https://apiforlearning.zendvn.com/api/mobile/sliders';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      List data = List.from(jsonData.map((value) => value['image']));
      return data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
