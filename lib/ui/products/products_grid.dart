import 'package:flutter/material.dart';
import 'package:myshop/ui/products/product_grid_tile.dart';
import 'package:myshop/ui/products/products_manager.dart';

class ProductsGird extends StatelessWidget {
  final bool showFavorites;

  const ProductsGird(this.showFavorites,{super.key});


  @override
  Widget build(BuildContext context) {
    final productManager = ProductManager();
    final products = showFavorites
        ? productManager.favoriteItems
        : productManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemBuilder: (ctx,i) => ProductGridTile(products[i]),
    );
  }

}