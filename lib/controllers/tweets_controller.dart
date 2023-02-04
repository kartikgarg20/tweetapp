import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:twitter_app/models/tweets_model.dart';
import 'package:twitter_app/services/api_services.dart';

class TweetsController extends GetxController {
  var tweetList = Rxn<TweetsApi>();

  final isLoading = true.obs;

  @override
  void onInit() {
    getTweet();

    super.onInit();
  }

  Future<void> getTweet() async {
    try {
      var data = await RemoteService.get(
          key: "user/tweets?username=Ravisutanjani&limit=40");
      var res = TweetsApi.fromJson(json.decode(data));
      if (res != null) {
        tweetList.value = res;
      }
      isLoading(false);

      // update();
    } on Exception catch (e) {
      isLoading(false);
      debugPrint(e.toString());
      update();
    }
  }
}
