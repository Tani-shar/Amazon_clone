import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone_tutorial/features/account/widgets/orders.dart';
import 'package:amazon_clone_tutorial/features/account/widgets/top_button.dart';
import 'package:flutter/material.dart';

class Account_screen extends StatelessWidget {
  const Account_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
          
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    width: 120,
                    height: 45,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: const Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 15 ),
                      child: Icon(Icons.notifications_outlined),
                      ),
                      Icon(Icons.search),  
                    ],
                  ),
                )
              ],
            ),
          ),
          
        ),
        body: const Column(
          children: [
            BelowAppBar(),
            SizedBox(height: 10,),
            TopButton(),
            SizedBox(height: 20,),
            OrderState()
          ],
        )
      );
    
  }
}