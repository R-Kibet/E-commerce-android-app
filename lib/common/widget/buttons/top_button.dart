import 'package:amazon_clone/common/widget/buttons/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
                text: "Orders",
                onTap: () {},
            ),
            AccountButton(
                text: "Wish List",
                onTap: (){}),
            AccountButton(
                text: "turn seller",
                onTap: () {})
          ],
        ),
      ],
    );
  }
}
