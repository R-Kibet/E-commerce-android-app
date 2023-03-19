import 'dart:io';

import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,

}) async{
    try {
      final cloud = CloudinaryPublic(
          'djhjql460',
          "rpu06egg",
      );

      List<String> imageUrls = [];

      for (int i = 0; i<images.length; i++) {
        CloudinaryResponse res = await cloud.uploadFile(CloudinaryFile.fromFile(
            images[i].path,
            folder: name,
        ),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price,
      );
    } catch  (e){
      showSnackBar(context, e.toString());
    }
  }
}