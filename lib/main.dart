import 'package:flutter/material.dart';
abstract class user{
  String ?name;
  String ?email;
  String ?uid;
  user({
    this.name ,this.email,this.uid
});
user.fromJson(Map<String,dynamic>json){
  name=json['name'];
  email=json['email'];
  uid=json['uid'];
}
  Map<String,dynamic>toMap()
  {
return {
  'name':name,
  'email':email,
  'uid':uid,
};
  }
}
class cars extends
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [];

  dynamic? imput1;

  dynamic? imput2;


  createnotes(){

}

deletenotes(){


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 0),
            width: double.infinity,
            color: Colors.purple,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              'Firebase Note',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(notes[index]),
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(notes[index]),
                      subtitle: Text(notes[index]),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            notes.removeAt(index);
                          },);
                        },
                      ),
                    ),
                  ),
                );
              }),
          Container(
            padding: EdgeInsets.only(right: 20, top: 450),
            alignment: Alignment.bottomRight,
            child: MaterialButton(
              color: Colors.purpleAccent,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      height: 600,
                      child: ListView(
                        children: [
                          TextFormField(
                            onChanged: (String value) {
                              imput1 = value;
                            },
                            maxLines: 2,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.title_outlined,
                                color: Colors.deepPurple[800],
                              ),
                              hintText: 'Not Title',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.cyan),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            onChanged: (String value) {
                              imput2 = value;
                            },
                            maxLines: 4,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.deepPurple[800],
                              ),
                              hintText: 'Email',
                              counterStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.cyan),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: MaterialButton(
                              onPressed: () {
                                setState(
                                  () {
                                    notes.add(imput1);
                                    notes.add(imput2);
                                  },
                                );
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'get data',
                                style: TextStyle(
                                    color: Colors.deepPurple[800],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                'enter ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
