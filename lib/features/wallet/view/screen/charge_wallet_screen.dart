import 'package:flutter/material.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';

class ChargeWalletScreen extends StatelessWidget {
  const ChargeWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrangeAppbarWidget(title: "Charge wallet"),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Price"),
            TextField(
                decoration: InputDecoration(
                    hintText: "00",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))))
          ],
        ),
      ),
    );
  }
}
