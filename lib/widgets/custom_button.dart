import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final IconData icon;
  final Function onTap;


  CustomButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: ClipOval(
        child: Material(
          color: Colors.grey.shade300,
          child: InkWell(
              child: SizedBox(width: 56, height: 56, child: Icon(icon)),
              onTap: onTap
          ),
        ),
      ),
    );
  }
}
