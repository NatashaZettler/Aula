import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget loadNetWorkImage(String path){
  return CachedNetworkImage(
    imageUrl: path,
    placeholder: (_c, _e) => CircularProgressIndicator(),
    errorWidget: (_c, _u, _e) => Image.asset('assets/flutter.png'),
  );
}