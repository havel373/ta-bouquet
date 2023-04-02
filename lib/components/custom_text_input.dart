import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData icon;
  final TextEditingController textEditCOntorller;
  final bool password;
  const CustomTextInput(
      {super.key,
      required this.label,
      required this.placeholder,
      required this.icon,
      required this.textEditCOntorller,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 56,
            child: TextField(
              controller: textEditCOntorller,
              obscureText: password,
              enableSuggestions: !password,
              autocorrect: !password,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 20, end: 20),
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                  borderSide: BorderSide(width: 1,color: Colors.black)
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey),
                hintText: placeholder,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
