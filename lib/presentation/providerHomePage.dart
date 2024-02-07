import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtec/logic/providerState.dart';

class ProviderHomePage extends StatefulWidget {
  const ProviderHomePage({Key? key}) : super(key: key);

  @override
  State<ProviderHomePage> createState() => _ProviderHomePageState();
}

class _ProviderHomePageState extends State<ProviderHomePage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
      ),
      body:StreamBuilder(
        stream: _firestore.collection("users").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshots){
          if(snapshots.connectionState == ConnectionState.waiting ){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshots.hasData && snapshots!=null){
            return ListView.builder(
                itemCount:snapshots.data!.docs.length,
                itemBuilder: (context,index){
                  Map<String,dynamic> userData = snapshots.data!.docs[index].data() as Map<String,dynamic> ;
                  return Card(
                    child: ListTile(
                      leading:Image.network(userData['avatar']),
                      title:Text(userData['first_name']) ,
                      subtitle:Text(userData['email']) ,
                    ),
                  );
                }
            );
          }else{
            return Center(child: Text("No Data Found"));
          }
        },
      )




      /*Consumer<ProviderState>(
        builder: (context,provider,child){


          return provider.isLoading?
              Center(child: CircularProgressIndicator())
            :
            ListView.builder(
              itemCount:provider.users.data.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading:Image.network(provider.users.data[index].avatar.toString()),
                    title:Text(provider.users.data[index].firstName.toString()) ,
                    subtitle:Text(provider.users.data[index].email.toString()) ,
                  ),
                );
              }
          );
        },
      )*/




    );
  }
}
