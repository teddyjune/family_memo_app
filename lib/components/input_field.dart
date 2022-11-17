import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Container(
            height: 52,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor, width: 0)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor, width: 0)),
                    ),
                  ),
                ),
                widget == null ? Container() : Container(child: widget)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
