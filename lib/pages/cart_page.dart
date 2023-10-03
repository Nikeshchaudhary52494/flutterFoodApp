import 'package:flutter/material.dart';
import 'package:grocery_app/pages/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(children: [
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                                title: Text(value.cartItems[index][0]),
                                // leading: value.cartItems[index][2],
                                leading: Image.asset(
                                  value.cartItems[index][2],
                                  width: 100,
                                ),
                                subtitle: Text(value.cartItems[index][1]),
                                trailing: IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () => Provider.of<CartModel>(
                                          context,
                                          listen: false)
                                      .removeItemFromCart(index),
                                )),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text("Total Price"),
                            Text(
                              value.calculateTotal(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Pay",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]);
          },
        ));
  }
}
