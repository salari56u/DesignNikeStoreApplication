import 'package:flutter/material.dart';
import 'package:nike_store/model/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "CartScreen",
          style: TextStyle(fontSize: 18),
        ),
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartmodel.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: mediaQuery.width,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartmodel[index].name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const Row(
                            children: [
                              Text(
                                "Review",
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("4.5",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold)),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          Text(
                            cartmodel[index].price,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shadowColor: Colors.blue,
                                    elevation: 5),
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                              ),
                              Text(
                                cartmodel[index].count.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shadowColor: Colors.blue,
                                    elevation: 5),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: mediaQuery.height,
                        decoration: BoxDecoration(
                          color: const Color(0xffE7F4FF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(cartmodel[index].image),
                      ),
                    ],
                  ),
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
                      "TotalPrice",
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                    Text(
                      "\$" + getTotalPrice().toStringAsFixed(2),
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Buy",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
