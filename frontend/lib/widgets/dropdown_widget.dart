import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final List<String> _valueList;
  final String _value;

  const DropdownWidget({
    super.key,
    required List<String> valueList,
    required String value,
  })  : _valueList = valueList,
        _value = value;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget._value; // 초기 값을 설정
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      padding: const EdgeInsets.symmetric(vertical: 10),
      dropdownColor: const Color(0xffFAF7F0),
      value: _selectedValue,
      items: widget._valueList.map(
        (value) {
          return DropdownMenuItem(
            alignment: Alignment.center,
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
      ).toList(),
      onChanged: (newValue) {
        setState(
          () {
            _selectedValue = newValue!;
          },
        );
      },
    );
  }
}
