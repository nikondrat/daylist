import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Function() onSubmitted;
  const CustomDialog(
      {super.key,
      required this.title,
      required this.children,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: Text(title),
        content: Column(mainAxisSize: MainAxisSize.min, children: children),
        actions: [
          TextButton(
              onPressed: () => context.pop(),
              child: Text(t.settings.cancel,
                  style: context.text.mediumText.copyWith(color: Colors.red))),
          TextButton(
              onPressed: () async {
                final ConnectivityResult connectivityResult =
                    await Connectivity().checkConnectivity();
                if (connectivityResult == ConnectivityResult.mobile ||
                    connectivityResult == ConnectivityResult.wifi) {
                  onSubmitted();
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(t.auth.errors.connection),
                        backgroundColor: Colors.red));
                  }
                }
              },
              child: Text(t.selection.add))
        ]);
  }
}
