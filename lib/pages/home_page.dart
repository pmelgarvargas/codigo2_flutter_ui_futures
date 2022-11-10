import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String name = "-";
  List<String> names = [];

  @override
  initState() {
    super.initState();

    // name = await getName();

    // getName().then((value) {
    //   name = value;
    //   setState(() {});
    // });

    fetchDataFinal();

  }

  Future<void> fetchDataFinal() async{
    names = await getData();
    setState(() {

    });
  }



  Future<String> getName() async {
    return Future.delayed(Duration(seconds: 4), () {
      return "Juan Carlos";
    });
  }

  Future<List<String>> getData () async {
    return Future.delayed(Duration(seconds: 3),(){
      return ["Juan", "Cristian", "Jaime", "Rolando", "Luis"];
    });
  }

   Future<List<Map<String, dynamic>>> getDataSuperheroe() async{
     return Future.delayed(const Duration(seconds: 7), (){
       return [
         {
           "name": "Molecule Man",
           "age": 29,
           "secretIdentity": "Dan Jukes",
           "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]
         },
         {
           "name": "Madame Uppercut",
           "age": 39,
           "secretIdentity": "Jane Wilson",
           "powers": [
             "Million tonne punch",
             "Damage resistance",
             "Superhuman reflexes"
           ]
         },
         {
           "name": "Flash",
           "age": 22,
           "secretIdentity": "Barry Allen",
           "powers": [
             "Super fast ",
           ]
         },
         {
           "name": "Superman",
           "age": 30,
           "secretIdentity": "Clark Kent",
           "powers": [
             "Super fast",
             "Fly"
           ]
         },
       ];
     });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Futures"),
        actions: [
          FutureBuilder(
            future: getName(),
            builder: (BuildContext context, AsyncSnapshot snap){
              if(snap.hasData){
                String _name = snap.data;
                return Text(_name);
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getDataSuperheroe(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          // print(snapshot.hasData);
          // print(snapshot.connectionState);
          // print(snapshot.data);

          if(snapshot.hasData){
            List<Map<String, dynamic>> _superheroes = snapshot.data;
            return ListView.builder(
              itemCount: _superheroes.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.24)
                    ),
                  ),
                  child: ListTile(
                    title: Text(_superheroes[index]["name"]),
                    subtitle: Text(_superheroes[index]["secretIdentity"]),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());


        },
      ),
    );
  }
}
