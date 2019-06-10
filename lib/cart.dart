import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shippingcart/bloc/cart_bloc.dart';

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
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocProvider(
        bloc: _cartBloc,
        child: BlocBuilder(
            bloc: _cartBloc, builder: (BuildContext context, List state) {
              var sum = 0;
              if(state.length > 0) {
                sum = state.map((item) => item.price)
                  .reduce((acc, e) => acc + e);
              }
              return Center(
                child: Text('합계 : $sum',
                  style: TextStyle(fontSize: 30),
                ),
              );
        }),
      ),
    );
  }
}