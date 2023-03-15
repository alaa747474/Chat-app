import 'package:flutter/material.dart';

Future<void> showCustomAlertDialog(
    BuildContext context, VoidCallback saveMessageMethod) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        content: SingleChildScrollView(
          child: ListBody(
            children:  [
              Text('Are you sure want to save this message?',style: Theme.of(context).textTheme.labelSmall,),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            onPressed: (){
              saveMessageMethod();
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}
