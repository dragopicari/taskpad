import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String appBarImage;
  final String title;
  final Widget child;

  const DetailsScreen({
    @required this.appBarImage,
    @required this.title,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(appBarImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            expandedHeight: 200,
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
