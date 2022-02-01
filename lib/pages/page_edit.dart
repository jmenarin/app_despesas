import 'package:flutter/material.dart';

class PageStatus extends StatefulWidget {
  String? nome;
  String? valor;
  String? vencimento;
  String? pagamento;
  PageStatus(this.nome, this.valor, this.vencimento, this.pagamento, {Key? key})
      : super(key: key);

  @override
  State<PageStatus> createState() => _PageStatusState();
}

class _PageStatusState extends State<PageStatus> {
  _verificarStatus() {
    switch (widget.pagamento) {
      case "Pago":
        return widget.pagamento = "Atrasado";

      case "Em dia":
        return widget.pagamento = "Pago";

      case "Atrasado":
        return widget.pagamento = "Pago";
    }
  }

  atualizar() {
    if (widget.pagamento == "Em dia" || widget.pagamento == "Atrasado") {
      return const Icon(Icons.thumb_up_alt_outlined);
    } else {
      return const Icon(Icons.thumb_down_alt_outlined);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhamento"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15),
            child: Text(widget.nome!, textAlign: TextAlign.center),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      color: Colors.red,
                      child: Center(child: Text(widget.valor!))),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      color: Colors.blue,
                      child: Center(child: Text(widget.vencimento!))),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 80,
                  color: Colors.amber,
                  child: Center(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              _verificarStatus();
                            });
                            Navigator.pop(context, widget.pagamento);
                          },
                          icon: atualizar()))),
            ],
          )
        ],
      ),
    );
  }
}
