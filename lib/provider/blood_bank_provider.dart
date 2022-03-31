import 'package:blood_bank/model/details.dart';
import 'package:blood_bank/service/backend_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BloodBankProvider extends ChangeNotifier {
  List<Details> details = [];
  bool loading = false;
  bool error = false;

  getData() async {
    Response response = await BackendService().getDetails('posts');
    if (response.statusCode == 200) {
      details = response.data.map<Details>((e) => Details.fromJson(e)).toList();
      print(details[0].toString());
      loading = false;
      error = false;

      notifyListeners();
    } else {
      loading = true;
      error = false;
      notifyListeners();
    }
  }
}
