import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart'; //flutter_bloc 에 포함된 패키지
import 'package:rxdart/rxdart.dart';

import '../item.dart';

/**
 * Created by freelife1191.good@gmail.com on 2019-06-10
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */

enum CartEventType {
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc {
  final itemList = [
    Item("맥북", 2000000),
    Item("생존코딩", 320000),
    Item("될때까지 안드로이드", 40000),
    Item("새우깡", 1200),
    Item("신라면", 2000),
  ];

  final _cartList = List<Item>();
  
  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]); //초기값 빈배열 넣기
  
  Stream<List<Item>> get cartList => _cartListSubject.stream;
  
  void add(CartEvent event) {
    switch(event.type) {
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
      case CartEventType.add:
        _cartList.add(event.item);
        break;
    }
    _cartListSubject.add(_cartList);
  }
}