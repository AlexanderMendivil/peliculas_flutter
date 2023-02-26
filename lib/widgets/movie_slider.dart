import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      child: Column(
        children:
         <Widget>[

          const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
          const Text('Populares', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          _MoviePoster()
        ]
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ((_, int index) => _MovieItem() )),
          );
  }
}

class _MovieItem extends StatelessWidget {

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
                child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage('https://via.placeholder.com/300x400'),
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