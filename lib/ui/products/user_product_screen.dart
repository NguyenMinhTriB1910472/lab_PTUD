import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:myshop/ui/products/user_product_list_tile.dart';

class UserProductScreen extends StatelessWidget{
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productManager =ProductManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('refresh products'),
        child: buildUserProductListView(productManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductManager productManager){
    return ListView.builder(
        itemBuilder: (ctx,i)=>Column(
          children:[
            UserProductListTile(
              productManager.items[i],
            ),
            const Divider()
          ]
        ));
  }
  Widget buildAddButton(){
    return IconButton(
      onPressed: () async{
        print('Go to edit product screen');
      },
      icon: const Icon(Icons.add),
    );
  }
}