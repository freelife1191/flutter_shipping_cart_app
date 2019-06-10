import 'package:flutter/widgets.dart';
import 'package:shippingcart/bloc/cart_bloc.dart';

/**
 * InheritedWidget 을 상속받으면
 * 하위 위젯들에게 무언가를 제공할 수 있는 것을 만들 수 있음
 *
 * Created by freelife1191.good@gmail.com on 2019-06-11
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */
class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  /**
   * 생성자를 외부에서 지정할 수 없도록 구현
   */
  // 중괄호로 감싸면 Option 처럼 사용할 수 있게 됨
  // Key는 모든 위젯에 유니크한 값
  CartProvider({Key key, CartBloc cartBloc, Widget child})
      : cartBloc = cartBloc ?? CartBloc(), //외부에서 cartBloc을 지정하지 않았다면 CartBloc()을 새롭게 생성해서 넣음
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return null;
  }
  
  static CartBloc of(BuildContext context) =>
      //타입을 검사 context가 CartProvider context가 맞다 cartBloc를 얻음
      (context.inheritFromWidgetOfExactType(CartProvider) as CartProvider).cartBloc;
}
