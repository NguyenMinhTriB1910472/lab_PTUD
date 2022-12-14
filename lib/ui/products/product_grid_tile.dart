import 'package:flutter/material.dart';
import 'package:myshop/ui/products/product_detail_screen.dart';

import '../../models/Product.dart';

class ProductGridTile extends StatelessWidget{
  const ProductGridTile(
      this.product,{
        super.key,
  });
  
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        icon: Icon(
          product.isFavorite ? Icons.favorite : Icons.favorite_border
        ),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print('My favorite Product!');
        },
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart
        ),
        onPressed: (){
          print('ADD item');
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}