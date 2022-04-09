import 'package:flutter/material.dart';
import 'package:mvvm_example_with_provider/view_model/pictures_view_model.dart';

import 'widgets/home/home_exports.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ListPicturesViewModel listPicturesViewModel = ListPicturesViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Photos"),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: listPicturesViewModel.fetchPictures(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                
                return SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listPicturesViewModel.pictures!.length,
                    itemBuilder: (BuildContext context, int index) {
                      
                      return SinglePicture(
                        index: index,
                        listPicturesViewModel: listPicturesViewModel,
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
