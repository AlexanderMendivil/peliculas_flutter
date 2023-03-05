import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/credits_response.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProviders>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot){

        if(snapshot.hasData){

          final data = snapshot.data!;
        return Container(
      margin: const EdgeInsets.only( bottom: 30 ),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index ) => _CastCard(actor: data[index],),
        ),
    );
        }
        return Container(
          constraints: const BoxConstraints(maxWidth: 150),
          height: 180,
          child: const CupertinoActivityIndicator(),
        );
      },
      );
  }
}

class _CastCard extends StatelessWidget {

final Cast actor;
const _CastCard({required this.actor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 10 ),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(actor.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
              ),
          ),
          const SizedBox( height: 5,),
          Text(actor.name, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
        ]
        ,),
    );
  }
}