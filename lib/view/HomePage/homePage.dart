import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/service/user_service.dart';
import 'package:pinterest_clone/view/HomePage/photo_page.dart';
import 'package:pinterest_clone/view/HomePage/widget/homepage_item.dart';
import '../../Model/PostModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: PhotoService.getUsers(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: HomeItem(
                        context,
                        postList[index],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoPage(item: postList[index],)));
                        },
                    );
                    },
                );
              } else {
                return const Center(
                  child: Text('No data',),);
              }
            }),
      ),
    );
  }
}
