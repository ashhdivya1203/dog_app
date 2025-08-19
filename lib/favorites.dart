import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'),),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.favorite_border_sharp),
            title: Text('Favorite Breeds'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Most Loved Breeds'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_border_rounded),
            title: Text('Breed Wishlist'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite Fact'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.recycling),
            title: Text('Clear Favorite'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}