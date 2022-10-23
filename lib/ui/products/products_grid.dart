import 'package:flutter/material.dart';
// import cho context.select
// LINE: 19
import 'package:provider/provider.dart';
//
import 'product_grid_tile.dart';
import 'products_manager.dart';

import '../../models/product.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  const ProductsGrid(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    //Doc ra danh asch cac product se hien thi tu ProductsManager
    final products = context.select<ProductsManager, List<Product>>(
        (productsManager) => showFavorites
            ? productsManager.favoriteItems
            : productsManager.items);
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductGridTitle(products[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
