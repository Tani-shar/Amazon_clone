import 'package:flutter/material.dart';

class OrderState extends StatefulWidget {
  const OrderState({super.key});

  @override
  State<OrderState> createState() => _OrderStateState();
}

class _OrderStateState extends State<OrderState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15,),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}