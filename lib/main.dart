import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductsManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => OrdersManager(),
          ),
        ],
        child: MaterialApp(
            title: 'My Shop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple,
              ).copyWith(secondary: Colors.deepOrange),
            ),
            home: const ProductsOverviewScreen(),
            routes: {
              CartScreen.routeName: (context) => const CartScreen(),
              OrdersScreen.routeName: (context) => const OrdersScreen(),
              UserProductScreen.routeName: (context) =>
                  const UserProductScreen(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == ProductDetailScreen.routeName) {
                final productId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailScreen(
                      context.read<ProductsManager>().findById(productId),
                    );
                  },
                );
              }

              return null;
            }));
  }
}
