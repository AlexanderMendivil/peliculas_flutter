import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;
  const MovieSlider({super.key, required this.movies, this.title, required this.onNextPage});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(movies.isEmpty){
      return SizedBox(
        width: size.width * 0.5,
        height: size.height * 0.1,
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 280,
      child: Column(
        children:
         <Widget>[

          if(title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), 
            child: Text(
              title ?? 'no title', 
              style: const TextStyle( 
                fontSize: 20, 
                fontWeight: FontWeight.bold 
                ),)),
          
          _MoviePoster(movies: movies, onNextPage: ()=> onNextPage(),)
        ]
      ),
    );
  }
}

class _MoviePoster extends StatefulWidget {
  final List<Movie> movies;
  final Function onNextPage;
const _MoviePoster({required this.movies, required this.onNextPage});

  @override
  State<_MoviePoster> createState() => _MoviePosterState();

}

class _MoviePosterState extends State<_MoviePoster> {

  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
        if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
          widget.onNextPage();
        } 
     });
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

final size = MediaQuery.of(context).size;

    if( widget.movies.isEmpty ){
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ((_, int index) {
                 final movie = widget.movies[index];

                return  _MovieItem(movie: movie ); } )),
          );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
const _MovieItem({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () =>  Navigator.pushNamed(context, 'detail', arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:  FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage( movie.fullPosterUrl ),
                  width: 130,
                  height: 200,
                  fit: BoxFit.cover,
                  ),
              ),
            ),
              const SizedBox(height: 5,),
              const Text(
              'Star wars: el retorno del nuevo Jedi silvestre de monte cristo',
               maxLines: 2,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.center,
               )
          ],
        ),
      );
  }
}