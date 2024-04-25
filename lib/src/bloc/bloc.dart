import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proyecto_1er_parcial_v2/src/bloc/validators.dart';
import 'package:proyecto_1er_parcial_v2/src/screens/feed_screen.dart';

class Bloc with Validators {
  final _userNameController = StreamController<String>();
  final _passwordController = StreamController<String>();

  String _currentUserName = "Monch";
  String _currentPassword = "12345";

  String _currentUserName2 = "Juanito";
  String _currentPassword2 = "66666";

  String _currentUserName3 = "Pedrito";
  String _currentPassword3 = "54321";

  Stream<String> get userName => _userNameController.stream;
  Stream<String> get password => _passwordController.stream;

  Function(String) get changeUserName {
    return (user) {
      _currentUserName = user;
      _currentUserName2 = user;
      _currentUserName3 = user;
      _userNameController.sink.add(user);
    };
  }

  Function(String) get changePassword {
    return (password) {
      _currentPassword = password;
      _currentPassword2 = password;
      _currentPassword3 = password;
      _passwordController.sink.add(password);
    };
  }

  dispose() {
    _userNameController.close();
    _passwordController.close();
  }

  void submit(BuildContext context) {
    if (_currentUserName == "Monch" && _currentPassword == "12345") {
      _currentUserName = "Monch";
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FeedScreen(userName: _currentUserName)),
      );
    } else if (_currentUserName2 == "Juanito" && _currentPassword2 == "66666") {
      _currentUserName = "Juanito";
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FeedScreen(userName: _currentUserName)),
      );
    } else if (_currentUserName3 == "Pedrito" && _currentPassword3 == "54321") {
      _currentUserName = "Pedrito";
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FeedScreen(userName: _currentUserName)),
      );
    } else {
      print("Credenciales incorrectas");
    }
  }
}

final bloc = Bloc();
