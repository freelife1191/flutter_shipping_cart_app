import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shippingcart/cart.dart';

import 'bloc/cart_bloc.dart';
import 'package:shippingcart/item.dart';

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
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context); //상위에서 내려오는 Bloc 가져오기
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
      body: BlocProvider(
          bloc: _cartBloc,
          child: BlocBuilder(
            bloc: _cartBloc,
            builder: (BuildContext context, List state) { //state 최근상태의 state가 넘어옴
              return ListView(
                children: _itemList
                    .map((item) => _buildItem(item, state, _cartBloc))
                    .toList(),
              );
          }),
      ),
    );
  }

  Widget _buildItem(Item item, List state, CartBloc cartBloc) {
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
              setState(() {
                if (isChecked) { //체크가 되어있으면 remove
                  //dispatch로 이벤트를 실행
                  cartBloc.dispatch(CartEvent(CartEventType.remove, item));
                } else { //체크가 안되었으면 add
                  cartBloc.dispatch(CartEvent(CartEventType.add, item));
                }
              });
            }), // trailing 오른쪽 끝에 뭔가를 둘 수있는 옵션
      ),
      padding: const EdgeInsets.all(8.0),
    );
  }
}
