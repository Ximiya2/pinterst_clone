import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../core/storage/storage.dart';
import '../../../service/photo_service.dart';
import 'Download_Item.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {

  // final ScrollController _scrollController = ScrollController();
  // //List<PhotoModel> photoList = [];
  // int _currentPage = 1;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _loadMoreData();
  //   _scrollController.addListener(() {
  //     if(_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       _loadMoreData();
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: box!.isNotEmpty ? MasonryGridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // controller: _scrollController,
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: box!.values.length,
                itemBuilder: (context, index) {
                  return DownloadItem(
                    context,
                    box!.getAt(index)!,
                        (){
                      box!.delete(index);
                      setState(() {});
                    },
                  );
                },
              ) : const SizedBox(
                child: Center(
                  child: Text(
                      'You haven\`t saved pictures'
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
  //
  // Future<void> _loadMoreData() async {
  //   var res = await  PhotoService.getPhotos(_currentPage);
  //   res.fold((l) {
  //     EasyLoading.showError(l);
  //   }, (r) {
  //     setState(() {
  //       box!.addAll(r);
  //       _currentPage++;
  //     });
  //     return box!;
  //   }
  //   );
  // }
}
