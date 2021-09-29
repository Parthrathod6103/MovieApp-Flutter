import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/text.dart';

class Toprated extends StatelessWidget {
  const Toprated({
    Key ? key,
    required this.toprated}):
        super(key : key);

  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:"Top Rated Movies",color: Colors.white,size: 20.0,),
          SizedBox(height:10,),
          Container(height: 270,
            child: ListView.builder(itemCount:toprated.length ,
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
                                    'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                ))),
                          ),
                          Container(child: modified_text(text:toprated[index]['title']!=null?
                          toprated[index]['title']:'Loading...', size: 10.0, color: Colors.white,),)
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
