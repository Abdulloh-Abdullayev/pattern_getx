import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/models/post_model.dart';
import 'package:patterns_getx/services/http_service.dart';
import 'package:patterns_getx/services/log_service.dart';

class CreateController extends GetxController {
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;


  void apiCreatePost(BuildContext context) async{
    String title = titleController.value.text.toString().trim();
    String body = bodyController.value.text.toString().trim();
    Post post =Post(title: title, body: body, userId: body.hashCode);

    var result = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if(result != null){
      Get.back(result: result);
    }
    else{
      Log.e("Something went wrong");
    }
  }
}