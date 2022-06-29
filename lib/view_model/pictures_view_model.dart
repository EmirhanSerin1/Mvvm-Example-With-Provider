
import 'package:mvvm_example_with_provider/model/picsum_model.dart';
import 'package:mvvm_example_with_provider/services/services.dart';

class ListPicturesViewModel{
  List<PicturesViewModel>? pictures;

  Future fetchPictures() async{
    final api = await PicsumService().fetcPicturesApi();

    this.pictures = api.map((e) => PicturesViewModel(e)).toList();

    return pictures;
  }

}


class PicturesViewModel {
  final PicsumModel? picsumModel;

  PicturesViewModel(this.picsumModel);
}
