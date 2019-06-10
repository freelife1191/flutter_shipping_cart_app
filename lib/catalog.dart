import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shippingcart/bloc/cart_provider.dart';
import 'package:shippingcart/cart.dart';
import 'package:shippingcart/item.dart';
import 'package:shippingcart/main.dart';

import 'bloc/cart_bloc.dart';

/**
 * Created by freelife1191.good@gmail.com on 2019-06-10
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */
class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context); //CartProvider의 cartBloc을 지정함
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Cart()));
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: cartBloc.cartList,
          builder: (context, snapshot) {
            return ListView(
              children: cartBloc.itemList
                  .map((item) => _buildItem(item, snapshot.data, cartBloc))
                  .toList(),
            );
          })
    );
  }

  Widget _buildItem(Item item, List<Item> state, CartBloc cartBloc, ) {
    final isChecked = state.contains(item);
    
    return Padding(
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 31.0),
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(
            icon: isChecked
            ? Icon( //체크가 되어있으면 red
                Icons.check,
                color: Colors.red,
              )
            : Icon(Icons.check),
            onPressed: () {
              if (isChecked) { //체크가 되어있으면 remove
                //dispatch로 이벤트를 실행
                cartBloc.add(CartEvent(CartEventType.remove, item));
              } else { //체크가 안되었으면 add
                cartBloc.add(CartEvent(CartEventType.add, item));
              }
            }), // trailing 오른쪽 끝에 뭔가를 둘 수있는 옵션
      ),
      padding: const EdgeInsets.all(8.0),
    );
  }
}
