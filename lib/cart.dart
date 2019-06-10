import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shippingcart/bloc/cart_bloc.dart';
import 'package:shippingcart/main.dart';

/**
 * Created by freelife1191.good@gmail.com on 2019-06-11
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    

    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder(
          stream: cartBloc.cartList,
          builder: (context, snapshot) {
            var sum = 0;
            if(snapshot.data.length > 0) {
              sum = snapshot.data.map((item) => item.price)
                  .reduce((acc, e) => acc + e);
            }

            return Center(
              child: Text(
                '합계 : $sum',
                style: TextStyle(fontSize: 30),
              ),
            );
          }
      )
    );
  }
}