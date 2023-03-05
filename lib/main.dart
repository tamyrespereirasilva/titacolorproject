import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TiTa Color Therapy',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TiTa Color Therapy'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>
        [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.fromLTRB (60.0, 15.0, 60.0, 15.0),
              textStyle: TextStyle(
                fontSize: 20
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage(Colors.red)),
              );
              ElevatedButton.styleFrom(
                  //minimumSize: Size(200, 50),
                  foregroundColor: Colors.red,
                  textStyle: const TextStyle(
                    fontSize: 25
                  ),
                  disabledBackgroundColor: Colors.deepOrangeAccent.withOpacity(0.5)
              );
            },
              child: const Text('Red'),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.fromLTRB (52.0, 15.0, 52.0, 15.0),
              textStyle: TextStyle(
                  fontSize: 20
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage(Colors.green)),
              );
              ElevatedButton.styleFrom(
                //minimumSize: Size(200, 50),
                  foregroundColor: Colors.green,
                  textStyle: const TextStyle(
                      fontSize: 25
                  ),
                  disabledBackgroundColor: Colors.deepOrangeAccent.withOpacity(0.5)
              );
            },
            child: const Text('Green'),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.fromLTRB (60.0, 15.0, 60.0, 15.0),
              textStyle: TextStyle(
                  fontSize: 20
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage(Colors.blue)),
              );
              ElevatedButton.styleFrom(
                //minimumSize: Size(200, 50),
                  foregroundColor: Colors.blue,
                  textStyle: const TextStyle(
                      fontSize: 25
                  ),
                  disabledBackgroundColor: Colors.deepOrangeAccent.withOpacity(0.5)
              );
            },
            child: const Text('Blue'),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              padding: EdgeInsets.fromLTRB (52.0, 15.0, 52.0, 15.0),
              textStyle: TextStyle(
                  fontSize: 20
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage(Colors.yellow)),
              );
              ElevatedButton.styleFrom(
                //minimumSize: Size(200, 50),
                  foregroundColor: Colors.yellow,
                  textStyle: const TextStyle(
                      fontSize: 25
                  ),
                  disabledBackgroundColor: Colors.deepOrangeAccent.withOpacity(0.5)
              );
            },
            child: const Text('Yellow'),
          ),
        ],
      ),
    ),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  LoadingScreen(Color color, {super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Chama o método após esperar 3 segundos
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondPage({} as Color)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final Color color;

  const SecondPage(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Retornar'),
                  content: const Text('Deseja retornar à tela inicial?'),
                  actions: [
                    TextButton(
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Sim'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        title: const Text('Color Page'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        )
      ),
      body: Container(
        color: color,
        child: Center(
          child: Image.asset(
            'assets/tita.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
