import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:twitter_app/models/replies_model.dart';
import 'package:twitter_app/services/api_services.dart';

class ReplyController extends GetxController {
  var replyList = Rxn<RepliesApi>();

  final isLoading = true.obs;

  @override
  void onInit() {
    getReply();

    super.onInit();
  }

  Future<void> getReply() async {
    try {
      var data = await RemoteService.get(
          key: "tweet/replies?tweet_id=1621140799642812423");
      var res = RepliesApi.fromJson(json.decode(data));
      if (res != null) {
        replyList.value = res;
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
