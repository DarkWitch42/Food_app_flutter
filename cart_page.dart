import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test001/components/my_buttons.dart';
import 'package:test001/components/my_cart_tile.dart';
import 'package:test001/models/restaurant.dart';
import 'package:test001/payment_page.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart button
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Are you sure you want to clear the cart?"),
                          actions: [
                            //cancle button
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancle"),
                            ),
                            //yes button
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: const Text("Yes"),
                            ),

                          ],
                        ),
                        );
                  },
                  icon: Icon(Icons.delete)
              ),
            ],
          ),
          body: Column(
            children: [

              //list of cart
              Expanded(
                child: Column(
                  children: [
                   userCart.isEmpty ?
                   const Expanded(
                     child: Center(
                       child: Text("Cart is Empty...."),
                     ),
                   )
                       : Expanded(
                        child: ListView.builder(
                          itemCount: userCart.length,
                            itemBuilder: (context, index) {
                
                            //get individual cart item
                              final cartItem = userCart[index];
                
                              //return cart title UI
                              return MyCartTile(cartItem: cartItem);
                            },
                        ),
                    ),
                  ],
                ),
              ),

              //button to pay

              MyButton(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentPage(),
                  ),
                  ),
                  text: "Go to Checkout"
              ),
              const SizedBox(height: 25,)
            ],
          ),
        );
      },
    );
  }
}
