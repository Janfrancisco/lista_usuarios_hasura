import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testeBloc/bloc/User-Bloc.dart';
import 'package:testeBloc/screens/components.dart/background-addUser.dart';

class AddUser extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.amberAccent,
        ),
        ClipPath(
          child: Container(
              // height: size.height,
              // color: Colors.amberAccent,
              ),
          clipper: BackgroundPageAddUser(),
        ),
        CustomPaint(
          child: Container(),
          painter: BackgroundAddUserPager(),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              padding: EdgeInsets.all(33),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Novo Usuário',
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        )),

                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: InputText(
                        text: "Nome",
                        controller: nameController,
                      ),
                    ),
                    //SizedBox(height: 30,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: InputText(
                        text: "E-mail",
                        controller: emailController,
                      ),
                    ),
                    Builder(builder: (context) {
                      return Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                            ),
                            onPressed: () async {
                              var name = nameController.text;
                              var email = emailController.text;

                              var t = await UserBloc().newUserBloc(name, email);
                              if (t) {
                                showSnack(context);
                              } else {
                                print('ok');
                                Navigator.pop(context);
                              }

                              nameController.text = "";
                              emailController.text = "";
                            },
                            child: Text(
                              "Adicionar",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 18),
                            ),
                          ))
                        ],
                      );
                    })
                  ],
                ),
              )),
        )
      ],
    );
  }

  void showSnack(ctx) {
    final snackBar = SnackBar(content: Text('Esse e-mail já está cadastrado'));
    Scaffold.of(ctx).showSnackBar(snackBar);
  }
}

class InputText extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const InputText({Key key, this.text, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        //accentColor: Colors.white,
        primaryColor: Colors.white,
      ),
      child: TextField(
          controller: controller,
          keyboardType: text == "E-mail"
              ? TextInputType.emailAddress
              : TextInputType.name,
          style: TextStyle(color: Colors.white),
          // textAlign: TextAlign.center,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: text == "Nome" ? "Nome" : "E-mail",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                text == "Nome" ? Icons.person : Icons.email,
                color: Colors.white,
              ))),
    );
  }
}
