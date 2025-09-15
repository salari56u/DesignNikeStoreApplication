import 'package:flutter/material.dart';
import 'package:nike_store/model/cart_model.dart';
import 'package:nike_store/model/product-model.dart';
import 'dart:math' as math;

import 'package:nike_store/screen/cart_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String value = '1';
  final List<String> sizes = ['1', '2', '3', '4', '5', '6', '7'];
  @override
  Widget build(BuildContext context) {
    const String desc =
        'Nike shoes are known for innovation, style, and performance. Since the 1960s, the brand has created iconic models like Air Jordan and Air Force 1, which are popular in both sports and fashion. With technologies such as Air cushioning and Flyknit, Nike sneakers are lighter and more comfortable. The “swoosh” logo and “Just Do It” slogan have made Nike a global symbol of determination and style.';
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F6FF),
        title: const Text(
          "DetailsScreen",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartScreen(),
              ));
            },
            icon:
                const Icon(Icons.shopping_basket_outlined, color: Colors.black),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline, color: Colors.red),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "Jordan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 76,
                          color: Colors.blue.shade100,
                          letterSpacing: 8),
                    ),
                    Transform.rotate(
                      angle: math.pi / -6,
                      child: Image.asset(
                        widget.product.image,
                        width: MediaQuery.of(context).size.width * 0.9,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                widget.product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const Text(
                desc,
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                "Size",
                style: TextStyle(fontSize: 22),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: List.generate(
                    sizes.length,
                    (index) {
                      final size = sizes[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            value = size;
                          });
                        },
                        child: SizeItem(item: size, value: value),
                      );
                    },
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       value = '1';
                  //     });
                  //   },
                  //   child: SizeItem(
                  //     item: '1',
                  //     value: value,
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       value = '2';
                  //     });
                  //   },
                  //   child: SizeItem(
                  //     item: '2',
                  //     value: value,
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       value = '3';
                  //     });
                  //   },
                  //   child: SizeItem(
                  //     item: '3',
                  //     value: value,
                  //   ),
                  // ),
                ),
              ),
              const Text(
                "Gallery",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: widget.product.gallery.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      widget.product.gallery[index],
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset(''),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 75,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(color: Colors.grey, fontSize: 22),
                        ),
                        Text(
                          widget.product.price,
                          style: const TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ));
                        cartmodel.add(CartModel(
                            name: widget.product.name,
                            price: widget.product.price,
                            image: widget.product.image,
                            count: 1));
                      },
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeItem extends StatelessWidget {
  const SizeItem({super.key, required this.item, required this.value});
  final String item;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: item == value ? Colors.blue : Colors.blue.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        item,
        style: const TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
