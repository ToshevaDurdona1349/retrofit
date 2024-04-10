import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jsonpleasholder_r/models/post_model.dart';
import 'package:jsonpleasholder_r/network/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Retrofit"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }
  FutureBuilder _body(){
    final apiService =ApiService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
        future: apiService.getPosts(),
        builder: (context,snapshot){
          if(snapshot.connectionState== ConnectionState.done){
            final List<PostModel> posts =snapshot.data!;
            return _posts(posts);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _posts(List<PostModel>posts){
    return ListView.builder(
      itemCount:posts.length,
        itemBuilder: (context,index){
      return Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black38,width: 1),
      ),
        child: Column(
          children: [
            Text(
                posts[index].title,
                 style: TextStyle(
                   fontWeight: FontWeight.bold
                 ),
            ),
            SizedBox(height: 10,),
            Text(
              posts[index].body,
            ),
            SizedBox(height: 10,),
            Text(
              posts[index].id.toString(),
            ),
          ],
        ),
    );
    },
    );
  }
}
