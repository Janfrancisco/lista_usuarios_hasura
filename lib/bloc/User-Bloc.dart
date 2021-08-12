import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testeBloc/models/user-model.dart';
import 'package:testeBloc/repository/User-repository.dart';

class UserBloc extends BlocBase {
  var repository = UserRepository();
  final _userController = new StreamController();

  final _nController = new StreamController<String>();

  Stream get outUser => _userController.stream;
  Stream<String> get outputUser => _nController.stream;

  UserBloc() {
    // addList();
    _userController.add(repository.getHaUsers());
    addList();
    _nController.add("testeBloc");
  }
  Future<bool> newUserBloc(String name, String email) async {
    print('newUserBloc');
    try {
      await repository.creteUser(name, email);
    } on Exception catch (e) {
      print(e);
      return true;
    }
    return false;
  }

  @override
  void addListener(void Function() listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    _userController.close();
    _nController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(void Function() listener) {
    // TODO: implement removeListener
  }

  void addList() {
    var user;
    user = repository.getHaUsers();
    print('addList');
    print(user);
  }

  void printUser(user) {}
}
