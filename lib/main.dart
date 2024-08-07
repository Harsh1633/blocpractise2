import 'package:blocpractise2/pages/home/bloc/home_bloc.dart';
import 'package:blocpractise2/pages/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    BlocProvider(
      // providers: [
      //   BlocProvider(create: (context) => HomeBloc()),
      //   // BlocProvider(create: (context) => WishBloc()), // Add WishlistBloc provider
      //   // BlocProvider(create: (context) => CartBloc()),
      // ],
      create: (context) => HomeBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
