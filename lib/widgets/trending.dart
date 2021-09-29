import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/text.dart';

class TrendingMovies extends StatelessWidget {
const TrendingMovies({
     Key ? key,
     required this.trending}):
     super(key : key);

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:"Trending Movies",color: Colors.white,size: 20.0,),
          SizedBox(height:10,),
          Container(height: 270,
          child: ListView.builder(itemCount:trending.length ,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
              return InkWell(
                onTap: (){

                },
                  child: Container(
                    width: 145,
                      child: Column(
                        children: [
                          Container(
                            height:250,
                            decoration: BoxDecoration(image: DecorationImage(
                                image:NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                                ))),
                          ),
                          Container(child: modified_text(text:trending[index]['title']!=null?
                            trending[index]['title']:'Loading...', size: 10.0, color: Colors.white,),)
                        ],

                      ),
                  ),
              );
          }
          ),)




        ],
      ),
    );
  }
}
