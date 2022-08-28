import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildCategory(String name, Color defaultFontColor, Size size,val,dropDown) {

  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: size.height * 0.025,
      horizontal: size.width * 0.075,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            color: defaultFontColor,
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: val,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) => dropDown(newValue!),
          items: <String>['Mobile', 'Computer', 'Tablet', 'Laptop']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    ),
  );
}
