import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Repetir { repetir, naorepetir }
enum Fixo { fixo, parcelado }

class NewCount extends StatefulWidget {
  const NewCount({Key? key}) : super(key: key);

  @override
  _NewCountState createState() => _NewCountState();
}

class _NewCountState extends State<NewCount> {
  Repetir? _repetir = Repetir.naorepetir;
  Fixo? _fixo = Fixo.fixo;
  final _descricao = TextEditingController();
  final _parcelas = TextEditingController();
  final controller = TextEditingController();
  Map<String, Map<String, String>> teste = {};

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? data = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (data != null && data != selectedDate) {
      setState(() {
        selectedDate = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar conta"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _descricao,
            decoration: const InputDecoration(
              label: Text("Descrição"),
            ),
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              label: Text("Valor"),
            ),
          ),
          const Text("Vencimento"),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Text(DateFormat("dd/MM/yyyy").format(selectedDate)),
          ),
          Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: 1,
          ),
          Row(
            children: [
              Radio<Repetir>(
                value: Repetir.naorepetir,
                groupValue: _repetir,
                onChanged: (Repetir? value) {
                  setState(() {
                    _repetir = value;
                  });
                },
              ),
              const Text("Não Repetir"),
              Radio<Repetir>(
                value: Repetir.repetir,
                groupValue: _repetir,
                onChanged: (Repetir? value) {
                  setState(() {
                    _repetir = value;
                  });
                },
              ),
              const Text("Repetir"),
            ],
          ),
          _repetir == Repetir.naorepetir ? Container() : parcelado(),
          _fixo == Fixo.fixo
              ? Container()
              : TextField(
                  controller: _parcelas,
                  keyboardType: TextInputType.number,
                ),
          const SizedBox(height: 10),
          Container(
              width: 200,
              height: 40,
              color: Colors.orange,
              child: TextButton(
                  onPressed: () {
                    teste.addAll({
                      _descricao.text: {
                        "Valor": controller.text,
                        "Vencimento": DateFormat("dd/MM/yyyy")
                            .format(selectedDate)
                            .toString(),
                      }
                    });

                    Navigator.pop(context, teste);
                  },
                  child: const Text("SALVAR")))
        ],
      ),
    );
  }

  parcelado() {
    return Column(
      children: [
        Container(
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
        Row(
          children: [
            Radio<Fixo>(
              value: Fixo.fixo,
              groupValue: _fixo,
              onChanged: (Fixo? value) {
                setState(() {
                  _fixo = value;
                });
              },
            ),
            const Text("Fixo")
          ],
        ),
        Row(
          children: [
            Radio<Fixo>(
              value: Fixo.parcelado,
              groupValue: _fixo,
              onChanged: (Fixo? value) {
                setState(() {
                  _fixo = value;
                });
              },
            ),
            const Text("Parcelado")
          ],
        ),
      ],
    );
  }
}
