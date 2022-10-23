import 'package:flutter/material.dart';
import 'package:lab3_myshop/ui/products/products_manager.dart';

import '../../models/product.dart';

// context.read line: 42
import 'package:provider/provider.dart';
//

class UserProductListTile extends StatelessWidget {
  final Product product;

  const UserProductListTile(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () async {
        context.read<ProductsManager>().deleteProduct(product.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(
              content: Text(
            'Product deleted',
            textAlign: TextAlign.center,
          )));
      },
      color: Theme.of(context).errorColor,
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        print('Go to edit product screen');
        //
        const snackBar = SnackBar(content: Text('Go to edit product screen'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
