import 'package:flutter/material.dart';

class DropdownComponent extends StatelessWidget {
  final List<String>? elementos;
  final Function(String)? onChanged;
  final String? itemSelecionado;

  DropdownComponent({this.elementos, this.onChanged, this.itemSelecionado});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      style: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
      ),
      items: elementos!.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (String? a) => onChanged!(a!),
      value: itemSelecionado,
    );
  }
}
