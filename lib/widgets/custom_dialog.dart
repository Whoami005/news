import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/theme/colors.dart';
import 'package:news/theme/text_style.dart';

class CustomDialog extends StatelessWidget {
  static void show({
    required String message,
    required BuildContext context,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(
            "Ошибка получения данных",
            style: TextStyle(color: NewsColors.red),
          ),
          content: SizedBox(
            width: 70,
            child: Center(
              child: Text(
                message,
                style: NewsTextStyle.title18bold(),
              ),
            ),
          ),
        );
      },
    );
  }

  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
