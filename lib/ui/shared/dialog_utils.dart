import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(BuildContext context,String message){
  return showDialog(
      context : context,
      builder:(ctx) => AlertDialog(
        title:const Text('Are you sure?'),
        content : Text(message),
        actions: <Widget>[
          TextButton(
              onPressed: (){
                Navigator.of(ctx).pop(true);
              },
              child: const Text('No')
          ),TextButton(
              onPressed: (){
                Navigator.of(ctx).pop(false);
              },
              child: const Text('Yes')
          ),
        ]
      ));
}