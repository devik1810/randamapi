import 'package:flutter/cupertino.dart';
import 'package:randamapi/utils/randamhelper.dart';
import 'package:randamapi/screen/model/randam_model.dart';

class RandamProvider extends ChangeNotifier {
  RandamHelper randamHelper = RandamHelper();

  Future<RandamModel?> getData() async {
    RandamModel? randamModel;
    randamModel = await randamHelper.RandamApi();
    return randamModel;
  }
}
