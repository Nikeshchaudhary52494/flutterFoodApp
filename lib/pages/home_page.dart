import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/pages/cart.dart';
import 'package:grocery_app/pages/cart_page.dart';
import 'package:grocery_app/pages/items_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.shopping_bag),
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CartPage();
              }))),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Good Morning",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Lets order some fresh Items",
                style: GoogleFonts.notoSerif(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemBuilder: (context, index) {
                    return ItemsTile(
                      name: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () =>
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index),
                    );
                  });
            })),
          ],
        ),
      ),
    );
  }
}
