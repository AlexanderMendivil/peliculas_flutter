import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar()
        ],
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amber,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true, 
        titlePadding: EdgeInsets.all(0),
        title: Container(
          child: Text('Movie.title', style: TextStyle(fontSize: 16),),
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,

          ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x400'),
          fit: BoxFit.cover,),),
    );
  }
}