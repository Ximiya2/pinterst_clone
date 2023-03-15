import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            Text('Вдохновляйте других с \n помощью пинов-идей',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Colors.white,
              fontSize: 20
            ),),
            SizedBox(height: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: StadiumBorder()),
                onPressed: (){},
                child: Text('Создать',style: TextStyle(color: Colors.white),)
            ),
          ],
        ),
      ),
    );
  }
}
