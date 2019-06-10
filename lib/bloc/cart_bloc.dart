import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart'; //flutter_bloc 에 포함된 패키지

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

class CartBloc extends Bloc<CartEvent, List<Item>> {
  @override
  List<Item> get initialState => []; //현재 아이템의 초기값 셋팅

  @override
  Stream<List<Item>> mapEventToState(CartEvent event) async*{ //이벤트를 계속 던지면 그에 따라 수행할 메서드
    switch(event.type) {
      case CartEventType.add:
        //CartBloc 안에는 현재상태를 얻어올 수 있는 currentState가 존재함
        currentState.add(event.item);
        break;
      case CartEventType.remove:
        currentState.remove(event.item);
        break;
    }
    // Stream 형태로 리턴하게하는 무언가를 만듬
    // yield 는 async* 로 만드는 currentState를 add나 remove 이벤트가 있을 때 마다 하나씩 하나씩 Stream으로 전달함
    yield currentState;
  }
  
}