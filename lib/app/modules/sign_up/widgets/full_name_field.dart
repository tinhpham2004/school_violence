import 'package:flutter/material.dart';
import 'package:school_violence_app/app/core/values/app_colors.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.transparent, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
      ),
      validator: (val) => val!.isEmpty ? 'Enter an Full Name' : null,
      onChanged: (val) {
        //setState(() => userName = val);
      },
    );
  }
}