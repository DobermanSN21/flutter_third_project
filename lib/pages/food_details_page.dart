import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/button.dart';
import 'package:flutter_application_3/models/food.dart';
import 'package:flutter_application_3/models/shop.dart';
import 'package:flutter_application_3/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
//quantity
  int quantityCount = 0;
//decrement
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

//increment
  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

// add to cart
  void addToCart() {
    // only add to cart if there is something in the cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.food, quantityCount);
      //let the user knew it was successfull}
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfull add to cart",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          //okay button
          actions: [
            IconButton(
              onPressed: () {
                //pop once to remove dialog box
                Navigator.pop(context);

                // pop again to previus screen
                Navigator.pop(context);
              },

              // pop again to go previous page
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of food details
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                //image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),

                const SizedBox(
                  height: 25,
                ),

                //rating
                Row(
                  children: [
                    // star icon
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),

                    const SizedBox(
                      width: 5,
                    ),

                    //rating number
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                //food name
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),

                const SizedBox(height: 25),
                //description
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  "Indulge in the exquisite flavors of our Tobikko Sushi. Each bite is a burst of sophistication and delight. Vibrant orange tobiko, or flying fish roe, delicately rests atop a pillow of expertly seasoned sushi rice. The delicate crunch of the tobiko complements the tender texture of the rice, creating a harmonious symphony of tastes and textures. Savor the oceanic essence as the tobiko releases its briny essence with every mouthwatering bite. Elevate your sushi experience with our Tobikko Sushi that embodies the essence of the sea in each meticulously crafted piece.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    height: 2,
                  ),
                )
              ],
            ),
          )),

          //price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    "\$" + widget.food.price,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  //quantity
                  Row(
                    children: [
                      //minus button
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryColor, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: decrementQuantity,
                        ),
                      ),

                      //quantity qount
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            quantityCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      //plus button
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryColor, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: incrementQuantity,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // add to cart
              MyButton(text: "Add to cart", onTap: addToCart),
            ]),
          )
        ],
      ),
    );
  }
}
