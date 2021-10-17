import 'dart:math';

import 'package:hasura_connect/hasura_connect.dart';
import 'package:testeBloc/models/user-model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/user-model.dart';

class UserRepository {
  static final url = dotenv.env['HASURA_URL'];
  HasuraConnect hasuraConnect = HasuraConnect(url);

  Future<List<User>> getHaUsers() async {
    var query = """
        query MyQuery {
      users(order_by: {id: desc}) {
        name
        email
      }
    }""";
    var response = await hasuraConnect.query(query);

    List<User> users;
    users = (response['data']['users']).map<User>((map) {
      return User.fromMap(map);
    }).toList();

    // print(users);
    users.forEach((element) {
      // print(element.name);
    });
    return users;
  }

  Stream<List<User>> getAllUser() {
    var query = """
      subscription MySubscription {
        users(order_by: {id: desc}) {
          name
          email
        }
      }

    """;

    var snapshot = hasuraConnect.subscription(query);
    var myList = snapshot.stream
        .map<List<User>>((list) => User.fromJsonList(list['data']['users']));

    return myList;

    /* hasuraConnect
        .subscription(query)
        .then((data) => data.listen((jsonList) {
              print('myList');
              print(jsonList['data']['users']);
              return User.fromJsonList(jsonList['data']['users']);
              print(myList[0].name);
            }));  */

    //return myList;
  }

  Future<User> getRandomUsers() async {
    var query = """
        query MyQuery {
      users {
        name
        email
      }
    }""";
    var response = await hasuraConnect.query(query);

    List<User> users;
    users = (response['data']['users']).map<User>((map) {
      return User.fromMap(map);
    }).toList();

    // print(users);
    users.forEach((element) {
      // print(element.name);
    });
    var randomIndex = Random().nextInt(users.length);
    var user = (users[randomIndex]);
    // print(users[randomIndex].name);
    return user;
  }

  creteUser(String name, String email) async {
    print('creteUser');
    var mutation = """
      MyMutation(\$email: String!, \$name: String!) {
      insert_users(objects: {name: \$name, email: \$email}) {
        affected_rows
      }
    }
    """;
    return await hasuraConnect
        .mutation(mutation, variables: {"name": name, "email": email});
  }
}
