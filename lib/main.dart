import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(title: 'App Gorjeta'),
    );
  }
}

class Home extends StatefulWidget {
  final String title;

  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  double? _gorjeta;

  void _calcularGorjeta() {
    double? valorConta = double.tryParse(_controller.text.replaceAll(',', '.'));
    if (valorConta != null) {
      setState(() {
        _gorjeta = valorConta * 0.10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calcula Gorjetas",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: const Color.fromRGBO(181, 192, 201, 1),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20.0),
                  child: Image.asset(
                    'images/Gorjeta.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller:
                        _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Digite o Valor da Conta",
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "💲",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _calcularGorjeta,
                  child: const Text("Calcular"),
                ),
                const SizedBox(height: 16),
                if (_gorjeta != null)
                  Text(
                    "Gorjeta: R\$ ${_gorjeta!.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
