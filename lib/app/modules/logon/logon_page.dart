import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamelist/app/modules/home/home_module.dart';
import 'package:gamelist/app/utils/routes.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LogonPage extends StatefulWidget {
  final String title;
  static const String route = '/logon';

  const LogonPage({Key key, this.title = "Logon"}) : super(key: key);

  @override
  _LogonPageState createState() => _LogonPageState();
}

class _LogonPageState extends State<LogonPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logon')),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: const Text('Entre com seu Email e Senha'),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Digite um valor de Email valido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Digite uma Senha valida';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await _signInWithEmailAndPassword();
                    Navigator.pushReplacementNamed(context, Routes.home);
                  }
                },
                child: const Text('Entrar'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _success == null
                    ? ''
                    : (_success
                        ? 'Sucesso em ' + _userEmail
                        : 'Usuário ou senha invalida'),
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Example code of how to sign in with email and password.
  _signInWithEmailAndPassword() async {
    FirebaseUser user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
    } catch (error) {
      var msg = error.toString();
      if (error.code == "ERROR_WRONG_PASSWORD") {
        msg = "Senha Inválida!";
      }

      showDialog(
        builder: (context) {
          return AlertDialog(
            title: new Text("Erro"),
            content: new Text(msg),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
        context: context,
      );
    }

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }
}
