import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test001/components/my_buttons.dart';
import 'package:test001/models/food.dart';
import 'package:test001/models/restaurant.dart';
class FoodPage extends StatefulWidget {

  final Food food;
  final Map<Addons, bool> selectedAddons = {};

   FoodPage({
    super.key,
    required this.food,
  }){
    //initialize selected addons to be false
    for (Addons addons in food.availableAddons) {
      selectedAddons[addons] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
//method to add to cart
void addToCart(Food food, Map<Addons, bool> selectedAddons) {

  //close the current food page to go back to menu

  Navigator.pop(context);

  //format the selected addons
  List<Addons> currentlySelectedAddons = [];
  for (Addons addons in widget.food.availableAddons) {
    if (widget.selectedAddons[addons] == true) {
      currentlySelectedAddons.add(addons);
    }
  }

  // add to cart
  context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [

                //food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(widget.food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),

                      //food price
                      Text('\₹'+widget.food.price.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 15),

                      //food description
                      Text(widget.food.description),
                      const SizedBox(height: 15),

                      Divider(
                          color: Theme.of(context).colorScheme.secondary
                      ),
                      const SizedBox(height: 15),
                      //addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),

                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            //get individual addons
                            Addons addons = widget.food.availableAddons[index];

                            //return check box tile

                            return CheckboxListTile(
                              title: Text(addons.name),
                              subtitle: Text('\₹'+addons.price.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).colorScheme.primary
                                ),
                              ),
                              value: widget.selectedAddons[addons],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addons] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //button -> add to cart
                MyButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                    text: "Add To Cart"
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
