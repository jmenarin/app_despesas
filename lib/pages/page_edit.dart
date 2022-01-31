import 'package:flutter/material.dart';

class PageStatus extends StatefulWidget {
  String? nome;
  String? valor;
  String? vencimento;
  String? status;
  PageStatus(this.nome, this.valor, this.vencimento, this.status, {Key? key})
      : super(key: key);

  @override
  State<PageStatus> createState() => _PageStatusState();
}

class _PageStatusState extends State<PageStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhamento"),
      ),
      body: Column(
        children: [
          Text(widget.nome!),
          Row(
            children: [
              Column(
                children: [
                  Text(widget.valor!),
                  Text(widget.vencimento!),
                ],
              ),
              Text(widget.status!),
            ],
          )
        ],
      ),
    );
  }
}
