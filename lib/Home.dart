import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens =[];
  void _carregarItens(){
    for(int i=0; i<=10; i++){

      Map<String, dynamic> item = Map();
      item["Titulo"] = "Título ${i} Lorem ipsum dolor sit amet";
      item["Descrição"] = "Descrição ${i} Lorem ipsum dolor sit amet";
      _itens.add(item);

    }

  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
            itemBuilder: (BuildContext, int index){
              //Map<String, dynamic> item = _itens[index];
            //print(" ${item["Titulo"]}");
              return ListTile(
                onTap:(){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text(_itens[index]["Titulo"]),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                      content: Text(_itens[index]["Descrição"]),
                      actions: [
                        ElevatedButton(onPressed: (){
                          print("Sim");
                          Navigator.pop(context);
                        }, child: Text("Sim")),
                        ElevatedButton(onPressed: (){
                          print("Nao");
                          Navigator.pop(context);
                        }, child: Text("Não")),

                      ],

                    );
                  });
                } ,
                title: Text(_itens[index]["Titulo"]),
                subtitle:  Text(_itens[index]["Descrição"]),
              );


            },
            ),
      ),
    );
  }
}
