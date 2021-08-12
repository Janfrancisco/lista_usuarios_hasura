import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testeBloc/bloc/User-Bloc.dart';
import 'package:testeBloc/repository/User-repository.dart';
import 'package:testeBloc/widget/listModel-View.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.getBloc<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Usuários - Hasura'),
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      builder: (_) => DialogInfo(),
                      context: context,
                    );
                  }))
        ],
      ),
      body: StreamBuilder(
        stream: UserRepository().getAllUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListModelView(
                    title: snapshot.data[index].name,
                    url: snapshot.data[index].email,
                  );
                });
          } else if (snapshot.hasError) {
            // TODO: do something with the error
            return Text(snapshot.error.toString());
          }
          // TODO: the data is not ready, show a loading indicator
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // var t = userBloc.newUserBloc("Rodo", "dfee@fer.com");
          Navigator.pushNamed(context, '/addUser');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DialogInfo extends StatelessWidget {
  const DialogInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Info'),
      content: Text('Aplicativo apenas para fins didaticos'),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Ok'))
      ],
    );
  }
}
