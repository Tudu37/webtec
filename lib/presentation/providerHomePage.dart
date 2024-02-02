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
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
      ),
      body:Consumer<ProviderState>(
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
      )


    );
  }
}
