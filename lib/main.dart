// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:despesas/pages/page_edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> names = [];

  Map<String, Map<String, String>> contas = {
    "Internet": {
      "Valor": "180",
      "Vencimento": "11/02/2022",
      "Status": "Atrasado"
    },
    "Energia": {
      "Valor": "480",
      "Vencimento": "11/02/2022",
      "Status": "Atrasado"
    },
    "Cartão": {
      "Valor": "480",
      "Vencimento": "11/02/2022",
      "Status": "Atrasado"
    },
    "Casa": {"Valor": "480", "Vencimento": "11/02/2022", "Status": "Atrasado"},
    "Agua": {"Valor": "480", "Vencimento": "11/02/2022", "Status": "Atrasado"}
  };
  List<String> meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de nomes"),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: (Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_outlined)),
                      Text(meses.first),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                )),
            Expanded(
                flex: 8,
                child: ListView.builder(
                    itemCount: contas.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => PageStatus(
                                      contas.keys.elementAt(index),
                                      contas.values
                                          .elementAt(index)["Valor"]
                                          .toString(),
                                          contas.values
                                          .elementAt(index)["Vencimento"]
                                          .toString(),contas.values
                                          .elementAt(index)["Status"]
                                          .toString())));
                        },
                        child:
                            ListTile(title: Text(contas.keys.elementAt(index))),
                      );
                    })),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total a Pagar"),
                      Text("Valor"),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Saldo a Pagar"),
                      Text("Valor"),
                    ],
                  ),
                ))
          ],
        )));
  }
}
