import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/Model/TisTheSeasonModel.dart';
import 'package:pinterest_clone/service/collenctions_service.dart';
import 'package:pinterest_clone/view/HomePage/TisTheSeason_page/widgets/TisTheSeason_item.dart';

class TisTheSeasonPage extends StatefulWidget {
  const TisTheSeasonPage({Key? key}) : super(key: key);

  @override
  State<TisTheSeasonPage> createState() => _TisTheSeasonPageState();
}

class _TisTheSeasonPageState extends State<TisTheSeasonPage> {

  List<TisTheSeasonModel> photoList = [];
  final ScrollController _scrollController = ScrollController();
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
        child: FutureBuilder(
            future: CollectionsService.TisTheSeasonPhotos(),
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
                    return TisTheSeasonItem(
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
    var res = await  CollectionsService.TisTheSeasonPhotos(page: _currentPage);
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
