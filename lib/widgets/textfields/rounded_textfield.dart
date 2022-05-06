import 'package:flutter/material.dart';

import '../../constant.dart';

class RoundedTextField extends StatefulWidget {
  RoundedTextField(this.textEditingController,
      {Key? key,
      this.labelText = '',
      this.trailingIcon = false,
      this.isObscure = false,
      required  this.validator,
      this.labelColor = Colors.black})
      : super(key: key);
  final String labelText;
  final Color labelColor;
  final bool trailingIcon;
  final bool isObscure;
  String Function(String?) validator;
  final TextEditingController textEditingController;
  final borderColor = Constants.APP_WHITE_COLOR, borderRadius = 15.0;
  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Constants.APP_TEXT_FIELD_COLOR,
          borderRadius: BorderRadius.circular(10),

        ),
        child: TextFormField(
          validator:widget.validator,

          controller: widget.textEditingController,
          style: TextStyle(fontSize: 12),
          obscureText: isObscure,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.labelText,
            suffixIcon: widget.trailingIcon == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: const Icon(Icons.remove_red_eye))
                : const Icon(
                    Icons.remove_red_eye,
                    color: Constants.APP_TEXT_FIELD_COLOR,
                  ),
            labelStyle: TextStyle(color: widget.labelColor, fontSize: 16),
            hintStyle: TextStyle(color: widget.labelColor, fontSize: 16),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                )),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ));
  }
}
