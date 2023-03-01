import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            _Overview(),
            const CastingCards()
          ]))
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
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: const Text('Movie.title', style: TextStyle(fontSize: 16),),

          ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x400'),
          fit: BoxFit.cover,),),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: 
            BorderRadius.circular( 20 ),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
               ),
            ),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Text('Movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text('Movie.originalTitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, ),
                Row(
                  children: [
                    const  Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                    const SizedBox( width: 5 ,),
                    Text('movie.voteAverage', style: textTheme.caption ,)
                  ]
                  ,)

              ],)
          ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(
        'Anim sunt dolor sit officia proident culpa. Excepteur voluptate ipsum id duis ad do consequat elit est sint officia. Occaecat officia cillum mollit cupidatat eu. Ad in adipisicing proident fugiat cupidatat quis nostrud. Aute consequat consectetur enim laborum ullamco aliqua tempor minim duis ea ea aliqua ipsum. Minim id duis amet in dolor ipsum ad sint in ea ea. Lorem voluptate eu aliqua cillum nulla veniam do in qui cupidatat elit qui.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}