import 'package:flutter/material.dart';
import 'package:test001/components/my_recipt.dart';
class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in Progress.........."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          MyRecipt(),
        ],
      ),
    );
  }
    //Custom nav bar msg or call driver
    Widget _buildBottomNavBar(BuildContext context) {
      return Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            //profile pic of driver
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(width: 10),

            //driver detail
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "D1",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                ),
                Text(
                    "Driver",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                ),
              ],
            ),

            Spacer(),

            Row(
              children: [
                //msg button
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.message),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                SizedBox(width: 10),
                //call button
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.call),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

