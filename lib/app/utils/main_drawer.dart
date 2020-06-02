import 'package:flutter/material.dart';
import 'package:gamelist/app/utils/routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _addDrawerItem(
            Icons.home,
             "Home",
               () => Navigator.pushReplacementNamed(context, Routes.home)),
          _addDrawerItem(
            Icons.videogame_asset,
             "Gêneros",
               () => Navigator.pushReplacementNamed(context, Routes.genre)),
          _addDrawerItem(
            Icons.games,
             "Games",
               () => Navigator.pushReplacementNamed(context, Routes.games),
          ),
          _addDrawerItem(
            Icons.phonelink,
             "Plataformas",
               () => Navigator.pushReplacementNamed(context, Routes.plataforms),
          ),
        ],
      ),
    );
  }
}

@override
  Widget _addDrawerItem(_icon, _text, _onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(_icon),
            Padding(
              padding: EdgeInsets.only(
                left: 8),
                child: Text(_text),
            ),
        ],
      ),
      onTap: _onTap,
    );
  }