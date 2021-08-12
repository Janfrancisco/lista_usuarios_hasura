import 'package:flutter/material.dart';

class ListModelView extends StatelessWidget {
  final String title;
  final String url;

  ListModelView({this.title, this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('$title');
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            FlutterLogo(),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text('$url')
              ],
            )
          ],
        ),
      ),
    );
  }
}
