import 'package:cartapp/cart_provider.dart';
import 'package:cartapp/constants/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'models/product_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    ProductsList productsList = ProductsList();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          "Grocers",
          style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (BuildContext context, value, Widget? child) {
              int count = cartProvider.cartItems.length;
              return Stack(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        size: size.width * 0.08,
                      )),
                  Positioned(
                    top: 5,
                    left: 27,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: size.width * 0.025,
                      child: Text(
                        count.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productsList.productNames.length,
              itemBuilder: (BuildContext context, int index) {
                final product = Product(
                  name: productsList.productNames[index],
                  description: productsList.productDescription[index],
                  price: double.parse(productsList.productPrices[index]),
                );
                int count = cartProvider.cartItems[product] ?? 0;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: size.height * 0.12,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          SizedBox(
                            height: double.infinity,
                            width: size.width * 0.2,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FractionallySizedBox(
                                  alignment: Alignment.center,
                                  heightFactor: size.height * 0.0019,
                                  widthFactor: size.width * 0.003,
                                  child: SvgPicture.asset(
                                    productsList.productImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productsList.productNames[index],
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600]),
                                    ),
                                    Text(
                                      productsList.productDescription[index],
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${productsList.productPrices[index]} Rs',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]),
                                ),
                              ],
                            ),
                          ),
                          Stack(alignment: Alignment.center, children: [
                            CircleAvatar(
                              backgroundColor: Colors.deepPurple[300],
                              radius: size.width * 0.09 / 2,
                            ),
                            Consumer(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return IconButton(
                                  iconSize: size.width * 0.09,
                                  color: Colors.white,
                                  onPressed: () {
                                    cartProvider.addToCart(product);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: size.width * 0.09 / 1.1,
                                  ),
                                );
                              },
                            ),
                            count > 0 ?
                            Positioned(
                              left: 28,
                                top: 28,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red[800],
                                  radius: 8,
                                  child: Text(
                              count.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                              ),
                            ),
                                )) : Container(),
                          ]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
