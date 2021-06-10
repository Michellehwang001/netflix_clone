import 'package:flutter/material.dart';

class NetflixAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isTop;

  const NetflixAppBar({Key key, this.isTop}) : super(key: key);

  @override
  _NetflixAppBarState createState() => _NetflixAppBarState();

  @override
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => Size.fromHeight(56.0);
}

class _NetflixAppBarState extends State<NetflixAppBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      color: widget.isTop ? Colors.transparent : Colors.black,
      child: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Text(
              'NETFLIX',
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(width: 16),
            DropdownButton(items: [
              DropdownMenuItem(
                  child: Text(
                '메뉴',
                style: TextStyle(color: Colors.white),
              )),
            ]),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {})
        ],
      ),
    );
  }
}
