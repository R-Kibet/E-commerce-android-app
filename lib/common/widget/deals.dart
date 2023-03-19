import 'package:flutter/material.dart';

class Deals extends StatefulWidget {
  const Deals({Key? key}) : super(key: key);

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
          ),
          child: const Text(
            "Deal of the day",
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
        ///product image
        Image.network(
            "https://images.unsplash.com/photo-1678737171211-bf2c3def509f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
            height: 235,
            fit: BoxFit.fitHeight,
        ),
        ///product name and description
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text("\$100",
          style: TextStyle(
            fontSize: 18
          ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 15,
            top: 5,
            right: 40,
          ),
          child: const Text (
            "Nyash worrior",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ///display a row of images of same options
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1678737171211-bf2c3def509f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1678737171211-bf2c3def509f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1678737171211-bf2c3def509f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1678737171211-bf2c3def509f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                height: 100,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
            child:  Text(
                "see all deals",
              style: TextStyle(
                color: Colors.cyan[800],
              )
            ),
        )
      ],
    );
  }
}
