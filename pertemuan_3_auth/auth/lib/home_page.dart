import 'package:flutter/material.dart';
import 'package:auth/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;

  void _loadUsesrname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _loadUsesrname();
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(child: Text('Ini adalah halaman User $namauser')),
      drawer: const Sidemenu(),
    );
  }
}
