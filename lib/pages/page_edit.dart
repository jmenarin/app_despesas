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
  bool _status = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.status == "Atrasado") {
      _status == true;
    } else {
      _status = false;
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
                              _status = !_status;
                              Navigator.pop(context, _status);
                            });
                          },
                          icon: _status
                              ? const Icon(Icons.add_call)
                              : const Icon(Icons.accessible)))),
            ],
          )
        ],
      ),
    );
  }
}
