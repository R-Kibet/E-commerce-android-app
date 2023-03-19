import 'package:amazon_clone/views/admin/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  ///navigate to add product
  void navigateToAddProduct() {
    Navigator.pushNamed(
        context,
        AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const Center(
        child: Text("product"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddProduct,
        tooltip: "add product",
        child:  const Icon(
            Icons.add),
      ) ,
    );
  }
}
