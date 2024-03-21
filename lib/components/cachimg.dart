import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cacheimage(String url){
  return CachedNetworkImage(
    height: 190,
    fit: BoxFit.fill,
    imageUrl: '${url}',
    placeholder: (context, url) => Image.asset('assets/cache.webp'),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
