import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.purple),
    );

  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies= [];
  List topratedmovies=[];
  List tv =[];

  final String apikey ='588ece6560d5ab19b05c2b23c6e40fec';
  final readacesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ODhlY2U2NTYwZDVhYjE5YjA1YzJiMjNjNmU0MGZlYyIsInN1YiI6IjYxM2IyMjUzZDcxMDdlMDA4ZTJmOTJlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OcFffCnKeOUVCogWBiQYQ_5dqapnKODkuD2KTEt5Eg0';

  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async {
    TMDB tmdbwithcustomLogs = TMDB(ApiKeys(apikey, readacesstoken),
        logConfig: ConfigLogger(
            showLogs: true,
            showErrorLogs: true
        ));
    Map trendingresult = await tmdbwithcustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithcustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcustomLogs.v3.tv.getPouplar();


    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
       tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ) ),
      ),
    );
  }
}



