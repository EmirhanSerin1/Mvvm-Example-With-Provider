import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example_with_provider/model/picsum_model.dart';
import 'package:mvvm_example_with_provider/view_model/pictures_view_model.dart';
import 'package:transparent_image/transparent_image.dart';

class SinglePicture extends StatefulWidget {
  const SinglePicture({
    Key? key,
    required this.index,
    required this.listPicturesViewModel,
  }) : super(key: key);

  final ListPicturesViewModel listPicturesViewModel;
  final int index;

  @override
  State<SinglePicture> createState() => _SinglePictureState();
}

class _SinglePictureState extends State<SinglePicture> {


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
      child: Container(
        width: 110,
        color: Colors.amber,
        // child: Text("${listPicturesViewModel.pictures![index].picsumModel!.downloadUrl} "),
        // child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "${widget.listPicturesViewModel.pictures![widget.index].picsumModel!.downloadUrl} ", fit: BoxFit.cover,),
        child: CachedNetworkImage(imageUrl: "${widget.listPicturesViewModel.pictures![widget.index].picsumModel!.downloadUrl}", fit: BoxFit.cover,)

        // child: Image.network(
        //   "${fetchData()}",
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
