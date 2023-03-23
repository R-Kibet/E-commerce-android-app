import 'dart:io';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/services/provider/user_provider.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import  'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../constants/env.dart';

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
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
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
      
      http.Response res = await http.post(Uri.parse("$uri/admin/add-product"),
      headers: {
        'Content-Type': "application/json; charset=UTF-8",
        'x-auth-token':userProvider.user.token,

      },
      body: product.toJson(),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product added successfully");
            Navigator.pop(context);
          } ,
      );
    } catch  (e){
      showSnackBar(context, e.toString());
    }
  }
}