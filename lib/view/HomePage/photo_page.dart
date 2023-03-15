import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/Model/photoModel.dart';
import 'package:pinterest_clone/view/HomePage/widget/homepage_item.dart';
import '../../core/storage/storage.dart';
import '../../service/photo_service.dart';
import '../../service/utils/gallery_saver.dart';

class PhotoPage extends StatefulWidget {
   PhotoPage({this.item,Key? key}) : super(key: key);
   PhotoModel? item;
  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  final ScrollController _scrollController = ScrollController();
  List<PhotoModel> photoList = [];
  int _currentPage = 1;
  bool boolling = false;

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
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // height: MediaQuery.of(context).size.height - 100,
              // width: MediaQuery.of(context).size.width,
                child: Stack(
                    children: [
                      Image.network(widget.item!.urls != null ? widget.item!.urls!.small != null ? widget.item!.urls!.small! : 'assets/greyPhoto.jpg' : 'assets/greyPhoto.jpg',fit: BoxFit.cover),
                      //Image.network(widget.item!.image),
                      Positioned(
                        top: 16,
                        right: 16,
                        child:  IconButton(
                          onPressed: (){
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => StatefulBuilder(
                                builder: (BuildContext context, void Function(void Function()) setState) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade800,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                                    ),
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                         Row(
                                           children: [
                                             IconButton(
                                                 onPressed: (){
                                                   Navigator.pop(context);
                                                   },
                                                 icon: const Icon(
                                                   Icons.cancel_outlined,
                                                   color: Colors.white,
                                                 ),
                                             ),
                                             SizedBox(width: 20,),
                                             TextButton(
                                                 onPressed: (){},
                                                 child: Text('Options',style: TextStyle(color: Colors.white,fontSize: 20),),
                                             ),
                                           ],
                                         ),
                                          Divider(thickness: 2,),
                                          TextButton(
                                            onPressed: (){},
                                            child: Text('Unfollow xkamilx',style: TextStyle(color: Colors.white,fontSize: 20),),
                                          ),
                                          TextButton(
                                            onPressed: (){},
                                            child: Text('Copy link',style: TextStyle(color: Colors.white,fontSize: 20),),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              await saveGallery(widget.item!.urls!.small!);
                                              },
                                            child: Text('Download image',style: TextStyle(color: Colors.white,fontSize: 20),),
                                          ),
                                          TextButton(
                                            onPressed: (){},
                                            child: Text('Hide Pin',style: TextStyle(color: Colors.white,fontSize: 20),),
                                          ),
                                          TextButton(
                                            onPressed: (){},
                                            child: Text('Report Pin',style: TextStyle(color: Colors.white,fontSize: 20),),
                                          ),
                                          TextButton(
                                            onPressed: (){},
                                            child: Text('This goes against Pinterst\`s Community Guidelines', maxLines: 2,style: TextStyle(color: Colors.white,fontSize: 20),),
                                          ),
                                        ],
                                      )
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]
                ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35))
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Center(
                                  child: widget.item!.urls!.small != null ? Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(widget.item!.urls != null ? widget.item!.urls!.small != null ? widget.item!.urls!.small! : 'assets/greyPhoto.jpg' : 'assets/greyPhoto.jpg'),
                                      ),
                                    ),
                                  ) :
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange
                                    ),
                                    child: Text(widget.item!.user != null ? widget.item!.user!.name != null ? widget.item!.user!.name!.substring(0,1) : 'No name' : 'No name'),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(widget.item!.user != null ? widget.item!.user!.name != null ? widget.item!.user!.name!.substring(0,1) : 'No name' : 'No name',style: TextStyle(fontSize: 20,color: Colors.white),),
                                  Text(widget.item!.user != null ? widget.item!.user!.name != null ? widget.item!.user!.name!.substring(0,1) : 'No name' : 'No name',style: TextStyle(fontSize: 12,color: Colors.white),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: StadiumBorder()),
                            onPressed: (){},
                            child: Text('Following',style: TextStyle(color: Colors.white),)
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(widget.item!.altDescription??''),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.favorite_border,color: Colors.white,size: 30,),
                        boolling == false ?
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: StadiumBorder()),
                            onPressed: (){
                                box!.add(widget.item!);
                                boolling = true;
                                setState(() {});
                            },
                            child: Text('Сохранить',style: TextStyle(color: Colors.white),)
                        ) :
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: StadiumBorder()),
                            onPressed: (){},
                            child: Text('Сохранено!',style: TextStyle(color: Colors.white),)
                        ),
                        Icon(Icons.share,color: Colors.white, size: 30,),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 2,),
            Container(
              // height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35))
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Похожие',style: TextStyle(color: Colors.white),),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: MasonryGridView.count(
                        physics: NeverScrollableScrollPhysics(),
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
                  ],
                )
              ),
            ),
          ],
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
