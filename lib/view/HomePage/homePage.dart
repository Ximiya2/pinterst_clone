import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/view/HomePage/photo_page.dart';
import 'package:pinterest_clone/view/HomePage/widget/homepage_item.dart';
import '../../Model/photoModel.dart';
import '../../service/photo_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _scrollController = ScrollController();
  List<PhotoModel> photoList = [];
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _loadMoreData();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels ==
      _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MasonryGridView.count(
            controller: _scrollController,
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: photoList.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: HomeItem(
                  context,
                  photoList[index],
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoPage(item: photoList[index],)));
                },
              );
              },
          ),
        ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    var res = await  PhotoService.getPhotos(_currentPage);
    res.fold((l) {
      EasyLoading.showError(l);
    }, (r) {
      setState(() {
        photoList.addAll(r);
        _currentPage++;
      });
      return photoList;
    }
    );
  }
}

/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/view/HomePage/photo_page.dart';
import 'package:pinterest_clone/view/HomePage/widget/homepage_item.dart';

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
            future: PhotoService.getPhotos(),
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
}*/
