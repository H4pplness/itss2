import 'package:flutter/material.dart';

class TitleAppbar extends StatelessWidget implements PreferredSizeWidget {
  Function()? leadingButtonOnPressed;
  Widget? title;
  List<Widget>? actions;
  TitleAppbar({Key? key, this.leadingButtonOnPressed,this.title,this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: Theme.of(context).appBarTheme.elevation,
      leading: IconButton(
          icon: IconTheme(
              data: Theme.of(context).appBarTheme.iconTheme!,
              child: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)),
          onPressed: leadingButtonOnPressed),
      title: title??Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
