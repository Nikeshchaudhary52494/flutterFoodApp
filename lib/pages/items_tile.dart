import 'package:flutter/material.dart';

class ItemsTile extends StatelessWidget {
  final String name;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;
  ItemsTile(
      {super.key,
      required this.name,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
                height: 75,
              ),
              Text(name),
              MaterialButton(
                onPressed: onPressed,
                color: color[800],
                child: Text(
                  itemPrice,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
