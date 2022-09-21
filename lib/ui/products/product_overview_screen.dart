import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_grid.dart';

enum FilterOptions {favorites,all}
class ProductOverviewScreen extends StatefulWidget{
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();

}

class _ProductOverviewScreenState extends State<ProductOverviewScreen>{
  var _showOnlyFavorites = false;

  get onSelected => null;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          buildShoppingCartIcon(),
           buildProductFillterMenu()
        ],
      ),
      body: ProductsGird(_showOnlyFavorites),
    );
  }

  Widget buildShoppingCartIcon(){
    return IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: (){
          print('Go to cart screen');
        }
    );
  }

  Widget buildProductFillterMenu() {
    return PopupMenuButton(
        onSelected:(FilterOptions selectedValue){
          setState((){
            if(selectedValue == FilterOptions.favorites){
              _showOnlyFavorites = true;
            }else{
              _showOnlyFavorites = false;
            }
          });
        },
        icon:const Icon(
          Icons.more_vert
        ),
        itemBuilder: (ctx) =>[
          const PopupMenuItem(
            value: FilterOptions.all
            ,child: Text('Show all'))
        ]);
  }
}