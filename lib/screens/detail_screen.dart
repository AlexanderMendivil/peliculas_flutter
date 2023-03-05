import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(title: movie.title, image: movie.fullBackdropPath,),
          SliverList(delegate: SliverChildListDelegate([
          _PosterAndTitle(title: movie.title, originalTitle: movie.originalTitle, image: movie.fullPosterUrl, voteAverage: movie.voteAverage,),
            _Overview(overview: movie.overview,),
            CastingCards(movieId: movie.id)
          ]))
        ],
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final String title; 
  final String image; 
  const _CustomAppBar({ required this.title, required this.image });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amber,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true, 
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child:  Text(title, style: const TextStyle(fontSize: 16),),

          ),
        background:  FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'), 
          image: NetworkImage(image),
          fit: BoxFit.cover,),),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
    final String title; 
    final String originalTitle;
    final String image;
    final double voteAverage;
  const _PosterAndTitle({super.key, required this.title, required this.originalTitle, required this.image, required this.voteAverage});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: 
            BorderRadius.circular( 20 ),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(image),
              height: 150,
              width: 110,
               ),
            ),
            const SizedBox(width: 20,),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 170),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2 ),                  
                   Text( originalTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2, ),
                  Row(
                    children: [
                      const  Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                      const SizedBox( width: 5 ,),
                      Text(voteAverage.toString(), style: textTheme.caption ,)
                    ]
                    ,)
            
                ],),
            )
          ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String overview;
  const _Overview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}