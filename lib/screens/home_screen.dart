import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon( Icons.search_off_outlined 
            )
          ),
          ],
      ),
      body: Column(
        children: const <Widget>[
          CardSwiper()
        ],
      ),
    );
  }
}