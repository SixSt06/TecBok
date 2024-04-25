import 'package:flutter/material.dart';
import 'package:proyecto_1er_parcial_v2/src/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  final bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TECBOK',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to Tecbok',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(width: 25),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                emailField(),
                passwordField(),
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                ),
                submitButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Tambien estos 2 widget
  Widget emailField() {
    return StreamBuilder(
      stream: bloc.userName,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: '',
              labelText: 'User',
              errorText:
                  snapshot.error != null ? snapshot.error.toString() : null),
          onChanged: bloc.changeUserName,
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
              labelText: 'Contraseña',
              hintText: 'Contraseña',
              errorText:
                  snapshot.error != null ? snapshot.error.toString() : null),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
        child: Text('Entrar'),
        onPressed: () {
          bloc.submit(context);
        });
  }
}
