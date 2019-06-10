import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'catalog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider( //BlocProvider는 여러가지 Bloc을 제공할 수 있음
      bloc: _cartBloc,
      child: BlocBuilder( //BlocProvider가 Bloc을 child에게 전달
          bloc: _cartBloc,
          builder: (BuildContext context, List state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: LoginScreen(),
            );
          }),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Center(
          child: RaisedButton(
              child: Text('Enter'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Catalog()));
              }),
        ));
  }
}
