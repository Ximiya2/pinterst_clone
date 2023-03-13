import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/view/HomePage/MuteAndPastel_page/widgets/MuteAndPastel_item.dart';
import '../../../Model/MuteAndPastelModel.dart';
import '../../../service/collenctions_service.dart';

class MuteAndPastelPage extends StatefulWidget {
  const MuteAndPastelPage({Key? key}) : super(key: key);

  @override
  State<MuteAndPastelPage> createState() => _MuteAndPastelPageState();
}

class _MuteAndPastelPageState extends State<MuteAndPastelPage> {

  List<MuteAndPastelModel> photoList = [];
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
            future: CollectionsService.MuteAndPastelPhotos(),
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
                    return MuteAndPastelItem(
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
    var res = await  CollectionsService.MuteAndPastelPhotos(page: _currentPage);
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
