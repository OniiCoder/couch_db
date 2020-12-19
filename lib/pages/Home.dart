import 'package:flutter/material.dart';
import 'package:couchdb/couchdb.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCouch();
  }

  Future<void> initCouch() async {
    final client = CouchDbClient(username: 'admin', password: 'favour4life');
    final dbs = Databases(client);
    final docs = Documents(client);

    try {
      final DatabasesResponse response1 = await dbs.allDocs('couch_todo');

      print(response1.rows[0]['todo_title']);

//      for (var i in response1.rows) {
//        // Some code here
//        print(i['doc']);
//      }

      final DocumentsResponse response2 = await docs.doc('couch_todo', '8e272664de1f072b870e889116003b9d');
      print(response2.doc['todo_title']);

//      var thing = response2.doc['some_attribute'];

    } on CouchDbException catch (e) {
      print('$e - error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Couch DB Demo'),
      ),
      body: Container(),
    );
  }
}
