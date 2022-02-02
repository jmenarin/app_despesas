import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

class NewCount extends StatefulWidget {
  const NewCount({Key? key}) : super(key: key);

  @override
  _NewCountState createState() => _NewCountState();
}

class _NewCountState extends State<NewCount> {
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar conta"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _descricao,
            decoration: InputDecoration(label: Text("Descrição")),
          ),
          MaskedTextField(
            maskedTextFieldController: _descricao,
            mask: "R\$ 0,00",
          )
        ],
      ),
    );
  }
}
