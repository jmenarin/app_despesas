// ignore_for_file: deprecated_member_use

import 'package:despesas/pages/new_count.dart';
import 'package:flutter/material.dart';
import 'package:despesas/pages/page_edit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
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
  String? data;
  num resultado = 0;

  Map<String, Map<String, dynamic>> contas = {
    "Internet": {
      "Valor": "180",
      "Vencimento": DateFormat("dd/MM/yyyy").format(DateTime.now()),
      "Pagamento": "Pago"
    },
    "Energia": {
      "Valor": "200",
      "Vencimento": DateFormat("dd/MM/yyyy").format(DateTime.now()),
      "Pagamento": "Atrasado"
    },
    "Cartão": {
      "Valor": "15",
      "Vencimento": DateFormat("dd/MM/yyyy").format(DateTime.now()),
      "Pagamento": "Pago"
    },
    "Casa": {"Valor": "50", "Vencimento": "10/02/2022", "Pagamento": "Em dia"},
    "Agua": {"Valor": "48", "Vencimento": "04/02/2022", "Pagamento": "Em dia"}
  };
  int mes = 3;
  int ano = 2020;
  int dia = 20;

  _verificarStatus(index) {
    switch (contas.values.elementAt(index)["Pagamento"]) {
      case "Pago":
        return Colors.green;

      case "Em dia":
        return Colors.yellow;

      case "Atrasado":
        return Colors.red;
    }
  }

  _clickProximo() {
    if (mes == 12) {
      mes = 1;
      ano++;
    } else {
      mes++;
    }
  }

  _clickAnterior() {
    if (mes == 1) {
      mes = 12;
      ano--;
    } else {
      mes--;
    }
  }

  _verificarMes() {
    switch (mes) {
      case 1:
        return "Janeiro";

      case 2:
        return "Fevereiro";

      case 3:
        return "Março";

      case 4:
        return "Abril";

      case 5:
        return "Maio";

      case 6:
        return "Junho";

      case 7:
        return "Julho";

      case 8:
        return "Agosto";

      case 9:
        return "Setembro";

      case 10:
        return "Outubro";

      case 11:
        return "Novembro";

      case 12:
        return "Dezembro";
    }
  }

  dinheiro() {
    resultado = 0;
    for (int ver = 0; ver < contas.keys.length; ver++) {
      resultado = resultado + num.parse(contas.values.elementAt(ver)["Valor"]);
      print(contas.values.elementAt(ver)["Valor"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    dinheiro();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de nomes"),
          actions: [
            IconButton(
                onPressed: () async {
                  Map<String, Map<String, String>> teste = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const NewCount()));

                  setState(() {
                    contas.addAll(teste);
                  });
                },
                icon: const Icon(Icons.add))
          ],
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
                          onPressed: () {
                            setState(() {
                              _clickAnterior();
                            });
                          },
                          icon: const Icon(Icons.arrow_back_ios_outlined)),
                      Text(_verificarMes()),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _clickProximo();
                            });
                          },
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
                        onTap: () async {
                          data = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => PageStatus(
                                      contas.keys.elementAt(index),
                                      contas.values.elementAt(index)["Valor"],
                                      contas.values
                                          .elementAt(index)["Vencimento"],
                                      contas.values
                                          .elementAt(index)["Pagamento"])));
                          setState(() {
                            contas[contas.keys.elementAt(index)]!["Pagamento"] =
                                data.toString();

                            if (data != null) {
                              _verificarStatus(index);
                            }
                          });
                        },
                        child: Container(
                            color: _verificarStatus(index),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(contas.keys
                                        .elementAt(index)
                                        .toString()),
                                    Text(contas.values
                                        .elementAt(index)["Vencimento"]
                                        .toString()),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                        "R\$ ${contas.values.elementAt(index)["Valor"]}"),
                                  ],
                                )
                              ],
                            )),
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
                    children: [
                      const Text("Saldo a Pagar"),
                      Text("R\$ $resultado"),
                    ],
                  ),
                ))
          ],
        )));
  }
}
