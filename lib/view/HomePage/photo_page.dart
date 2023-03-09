import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/view/HomePage/widget/homepage_item.dart';
import '../../Model/PostModel.dart';
import '../../Model/UserModel.dart';
import '../../service/user_service.dart';

class PhotoPage extends StatefulWidget {
   PhotoPage({this.item,Key? key}) : super(key: key);
   PostModel? item;
  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
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
                      Image.asset(widget.item!.image,fit: BoxFit.cover),
                      //Image.network(widget.item!.image),
                      Positioned(
                        top: 16,
                        right: 16,
                        child:  IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,color: Colors.white,),)
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Center(
                              child: User.userImage != null ? Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(User.userImage!),
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
                                child: Text(User.name.substring(0,1)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(User.name,style: TextStyle(fontSize: 20,color: Colors.white),),
                              Text(User.email,style: TextStyle(fontSize: 12,color: Colors.white),),
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
                      child: FutureBuilder(
                          future: PhotoService.getUsers(),
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return MasonryGridView.count(
                                physics: NeverScrollableScrollPhysics(),
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
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
