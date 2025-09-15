import 'package:flutter/material.dart';
import 'package:nike_store/model/product-model.dart';
import 'package:nike_store/screen/cart_screen.dart';
import 'package:nike_store/screen/details_Screen.dart';

class BeginScreen extends StatelessWidget {
  const BeginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF5F6FF),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              const TopIconSection(),
              const SearchBarSection(),
              const BrandSection(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Shoes",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 275,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return PopularShoesSection(
                      index: index,
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 275,
                child: ListView.builder(
                  itemCount: productList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return NewArrivalItemSection(
                      index: index,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

//بخش کفش های جدید
class NewArrivalItemSection extends StatelessWidget {
  const NewArrivalItemSection({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              product: productList[index],
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffE7F4FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                productList[index].image,
                width: MediaQuery.of(context).size.width * 0.45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productList[index].name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Review',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '4.5',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: const Color(0xff2D96FF)),
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    productList[index].price,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//

// بخش کفش های مشهور
class PopularShoesSection extends StatelessWidget {
  const PopularShoesSection({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              product: productList[index],
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        //height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding:
              const EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 5),
          child: Column(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffE7F4FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  productList[index].image,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 155,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList[index].name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Row(
                        children: [
                          Text(
                            'Review',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          )
                        ],
                      ),
                      Text(
                        productList[index].price,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: const Color(0xff2D96FF)),
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//

//بخش برند
class BrandSection extends StatelessWidget {
  const BrandSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 15,
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 15, top: 5, left: 5, bottom: 5),
            decoration: BoxDecoration(
              color: const Color(0xff2096FF),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Row(
              spacing: 10,
              children: [
                LogoImagesSection(
                  imageName: 'simple-icons_nike',
                ),
                Text(
                  'Nike',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const LogoImagesSection(
            imageName: 'simple-icons_puma',
          ),
          const LogoImagesSection(
            imageName: 'simple-icons_jordan',
          ),
          const LogoImagesSection(
            imageName: 'simple-icons_nike',
          ),
          const LogoImagesSection(
            imageName: 'gg_adidas',
          )
        ],
      ),
    );
  }
}
//

//تابع مربوط به  لوگوی بخش برند ها
class LogoImagesSection extends StatelessWidget {
  const LogoImagesSection({super.key, required this.imageName});
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image.asset('assets/images/$imageName.png'),
    );
  }
}
//

class TopIconSection extends StatelessWidget {
  const TopIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/hugeicons_menu-circle.png',
              width: 24,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
          },
          child: const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.shopping_basket_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.78,
          height: 60,
          padding: const EdgeInsets.only(left: 7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'search',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const Card(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
