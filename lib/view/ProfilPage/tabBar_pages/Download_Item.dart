import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/Model/photoModel.dart';

Widget DownloadItem(BuildContext context, PhotoModel post,void Function() delete){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FadeInImage(
        image: NetworkImage(post.urls?.small != null ? post.urls!.small! : 'assets/greyPhoto.jpg'),
        placeholder: AssetImage('assets/greyPhoto.jpg'),
        width: MediaQuery.of(context).size.width,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              post.likes != null ?
              Icon(Icons.favorite, color: Colors.red,size: 20,)
                  : SizedBox(),
              post.likes != null ?
              Text(post.likes.toString())
                  : SizedBox(),
            ],
          ),
          IconButton(
            onPressed: delete,
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      post.altDescription != null ?
      Text(post.altDescription??'',
          maxLines: 2)
          : SizedBox(),
    ],
  );
}