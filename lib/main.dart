import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testeBloc/bloc/User-Bloc.dart';
import 'package:testeBloc/repository/pokemon-repository.dart';
import 'package:testeBloc/screens/newUser-screen.dart';
import 'package:testeBloc/screens/pokemons-screen.dart';
import 'package:testeBloc/screens/users-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ApiPokemon().getAllPokemon();
    return BlocProvider(
        blocs: [Bloc((i) => UserBloc())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primarySwatch: Colors.amber),
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/': (context) => UserScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/addUser': (context) => AddUser(),
          },
        ));
  }
}
