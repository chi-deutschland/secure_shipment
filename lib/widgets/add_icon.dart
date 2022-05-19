import 'package:flutter/material.dart';

class AddIconWidget extends StatefulWidget {
  const AddIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddIconWidget> createState() => _AddIconWidgetState();
}

class _AddIconWidgetState extends State<AddIconWidget> {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.add,
      size: 40,
    );
  }
}
