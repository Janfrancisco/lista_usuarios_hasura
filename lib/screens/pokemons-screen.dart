import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testeBloc/bloc/User-Bloc.dart';
import 'package:testeBloc/repository/pokemon-repository.dart';
import 'package:testeBloc/repository/user-repository.dart';

class PokemonScreen extends StatelessWidget {
  final UserRepository user = UserRepository();

  ApiPokemon api = ApiPokemon();
  @override
  Widget build(BuildContext context) {
    //UserRepository().getAllUser();

    final userBloc = BlocProvider.getBloc<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pokemons'),
      ),
      body: StreamBuilder<String>(
          stream: userBloc.outputUser,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text('Nenhum dado encontrado'),
                ),
              );
            }

            //List<Pokemon> list = snapshot.data;
            //List<User> list = snapshot.data;
            return Center(
              child: Text(snapshot.data),
            );
            //print(snapshot.data);
            //return Container();
            /* return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListModelView(
                    title: snapshot.data[index].name,
                    url: snapshot.data[index].email,
                  );
                }); */
          }),
    );
  }
}
