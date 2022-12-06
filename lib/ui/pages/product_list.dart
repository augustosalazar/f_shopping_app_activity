import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/product.dart';
import '../Widgets/banner.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [const CustomBanner(50), customAppBar()],
            ),
            Obx(() => Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 0, //somelist.on.controller.length,
                      itemBuilder: (context, index) {
                        return _row(Product(0, 'some name', 0), index);
                        //return _row(entry on a list of a controller, index);
                      }),
                ))
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              key: Key('backAction'),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          product.name,
          key: const Key('productName'),
        ),
        Text(
          product.price.toString(),
          key: const Key('productPrice'),
        ),
        Column(
          children: [
            IconButton(
                key: const Key('addProduct'),
                //onPressed: () => method to add an entry to the list on the controller,
                onPressed: () {},
                icon: const Icon(Icons.arrow_upward)),
            IconButton(
                key: const Key('removeProduct'),
                onPressed: () {},
                //onPressed: () => method to remove an entry on the controller
                icon: const Icon(Icons.arrow_downward))
          ],
        ),
        Column(
          key: const Key('productQuantity'),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.quantity.toString()),
            ),
          ],
        )
      ]),
    );
  }
}
