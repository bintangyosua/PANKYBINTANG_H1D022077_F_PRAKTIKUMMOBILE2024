import 'package:flutter/material.dart';
import 'package:auth/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var namauser;

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namacontroller, placeholder, isPassword) {
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,
      decoration: InputDecoration(hintText: placeholder),
    );
  }

  _showDialog(pesan, alamat) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(pesan), actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => alamat));
                },
                child: const Text('OK'))
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _showInput(_usernameController, 'Masukkan Username', false),
              _showInput(_passwordController, 'Masukkan Password', true),
              ElevatedButton(
                  onPressed: () {
                    if (_usernameController.text == 'admin' &&
                        _passwordController.text == 'admin') {
                      _saveUsername();
                      _showDialog('Anda Berhasil Login', const HomePage());
                    } else {
                      _showDialog(
                          'Username dan Password Salah', const LoginPage());
                    }
                  },
                  child: const Text('Login'))
            ],
          )),
    );
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var username = prefs.getString('username');
    print(username);
    runApp(MaterialApp(home: username == null ? LoginPage() : HomePage()));
  }
}
