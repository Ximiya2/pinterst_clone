import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/view/ProfilPage/tabBar_pages/CreatePage.dart';
import 'package:pinterest_clone/view/ProfilPage/tabBar_pages/DownloadPage.dart';
import '../../Model/UserModel.dart';

class ProfilPage extends StatefulWidget {
   ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage>
    with SingleTickerProviderStateMixin {

   late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share),),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz),)
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Center(
              child: User.userImage != null ? Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(User.userImage!),
                  ),
                ),
              ) :
              Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange
              ),
                child: Text(User.name.substring(0,1)),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(User.name,style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
          Text(User.email,style: TextStyle(fontSize: 16,color: Colors.grey,),),
          SizedBox(height: 10,),
          Text('0 подписчиков - 3 подписки',style: TextStyle(fontSize: 18,color: Colors.white,),),
          SizedBox(height: 40,),
          DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    controller: tabController,
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: const [
                      Text('Созданные',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),),
                      Text(
                        'Сохранено',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.74,
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade700,
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              prefixIcon: const Icon(Icons.search, color: Colors.white,),
                              hintText: 'Поиск пинов',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Icon(Icons.add, color: Colors.white,size: 35,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: TabBarView(
                        controller: tabController,
                        children: const [
                         CreatePage(),
                         DownloadPage(),
                        ]),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
