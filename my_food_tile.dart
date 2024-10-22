import 'package:flutter/material.dart';
import 'package:test001/models/food.dart';
class FoodTile extends StatelessWidget {

  final Food food;
  final Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                //text food detail
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.name),
                        Text('\₹'+food.price.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(food.description,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),
                ),

                const SizedBox(width: 15),
                //food image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRect(
                      child: Image.asset(food.imagePath, height: 120),
                  ),
                ),
              ],
            ),
          ),
        ),

        //dividers
         Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )

      ],
    );
  }
}
