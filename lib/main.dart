import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_example/base/base_state.dart';
import 'package:list_example/pages/list_page/bloc/item_bloc.dart';
import 'package:list_example/pages/list_page/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => ItemBloc(),
        child: const ListPage(),
      ),
    );
  }
}
