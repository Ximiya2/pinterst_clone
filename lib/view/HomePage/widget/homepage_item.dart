import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/Model/PostModel.dart';

Widget HomeItem(BuildContext context, PostModel post){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FadeInImage(
        image: AssetImage(post.image),
        placeholder: AssetImage('assets/ph1.jpg'),
        width: MediaQuery.of(context).size.width,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              post.like != null ?
              Icon(Icons.favorite, color: Colors.red,size: 20,)
                  : SizedBox(),
              post.like != null ?
              Text(post.like!)
                  : SizedBox(),
            ],
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      post.title != null ?
      Text(post.title!,maxLines: 2,)
          : SizedBox(),
    ],
  );
}