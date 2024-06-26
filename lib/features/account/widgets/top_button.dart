import 'package:amazon_clone_tutorial/features/account/widgets/accountbutton.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Orders', onTap: (){}),
          
            AccountButton(text: 'Turn Seller', onTap: (){}),
          ],
        
        ),
        Row(
          children: [
            AccountButton(text: 'Logout', onTap: (){}),
          
            AccountButton(text: 'Your Wishlist', onTap: (){}),
          ],
        ),
      ]
    );
      
  
  }
}