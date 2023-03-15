import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/Model/Yellow RushModel.dart';
import 'package:pinterest_clone/Model/photoModel.dart';
import 'package:pinterest_clone/view/HomePage/Yellow%20Rush_page/widgets/Yellow%20Rush_item.dart';
import 'package:pinterest_clone/view/HomePage/widget/homepage_item.dart';
import '../../../service/collenctions_service.dart';

class YellowRushPage extends StatefulWidget {
  const YellowRushPage({Key? key}) : super(key: key);

  @override
  State<YellowRushPage> createState() => _YellowRushPageState();
}

class _YellowRushPageState extends State<YellowRushPage> {

  final ScrollController _scrollController = ScrollController();
  List<PhotoModel> photoList = [];
  int _currentPage = 1;

  void initFunc() {
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
        child: FutureBuilder(
            future: CollectionsService.YellowRushPhotos(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                snapshot.data?.fold((l) {
                  EasyLoading.showError(l);
                }, (r) {
                  EasyLoading.dismiss();
                  photoList = r;
                });
                return MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: photoList.length,
                  itemBuilder: (context, index) {
                    return HomeItem(
                      context,
                      photoList[index],
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
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    var res = await  CollectionsService.YellowRushPhotos(page: _currentPage);
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
