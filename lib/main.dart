import 'package:cat_trivia/business_logic/bloc/fact_bloc.dart';
import 'package:cat_trivia/business_logic/repository/local_repo.dart';
import 'package:cat_trivia/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalRepo().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FactBloc()..add(FetchFactEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => FactBloc()..add(FetchFactEvent()),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
