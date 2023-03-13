import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/Model/Yellow RushModel.dart';

import '../../../../Model/MuteAndPastelModel.dart';

Widget MuteAndPastelItem(BuildContext context, MuteAndPastelModel post){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FadeInImage(
        image: NetworkImage(post.urls != null ? (post.urls.small != null ? post.urls.small : 'assets/greyPhoto.jpg') : 'assets/greyPhoto.jpg'),
        placeholder: const AssetImage('assets/greyPhoto.jpg'),
        width: MediaQuery.of(context).size.width,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.favorite, color: Colors.red,size: 20,),
              Text(post.likes.toString() ?? '0')
            ],
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      Text(post.altDescription??'',
          maxLines: 2)
    ],
  );
}