import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'main.dart';

class TransactionListPage extends StatefulWidget {
  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ), */
        title: const Text('Recent Transactions'),
        backgroundColor: Colors.black,
        centerTitle: true,
        /* flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xFF063455), Color(0xFF063455)])),
          ) */
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Retrieve the transactions collection from Firestore
        stream:
            FirebaseFirestore.instance.collection('transactions').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Create a ListView of transaction documents
          List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              QueryDocumentSnapshot document = documents[index];
              // Create a ListTile for each transaction document

              if ((document['type']) == "Income") {
                return Card(
                    child: ListTile(
                  leading: Image.asset('images/${document['category']}.png'),
                  title: Text(document['note']),
                  subtitle: Text(document['date'].toDate().toString()),
                  trailing: Text(
                      ' + \u{20B9} ${document['amount'].toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.green)),
                ));
              } else {
                return Card(
                    child: ListTile(
                  leading: Image.asset('images/${document['category']}.png'),
                  title: Text(document['note']),
                  subtitle: Text(document['date'].toDate().toString()),
                  trailing: Text(
                      ' - \u{20B9} ${document['amount'].toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.red)),
                ));
              }
            },
          );
        },
      ),
    );
  }
}
