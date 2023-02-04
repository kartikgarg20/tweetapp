import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:twitter_app/controllers/replies_controller.dart';
import 'package:twitter_app/controllers/tweets_controller.dart';

class ReplyPage extends StatefulWidget {
  var id;
  ReplyPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ReplyPage> createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  ReplyController _replyController = Get.put(ReplyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'Tweet',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => _replyController.isLoading.isTrue
            ? const Center(
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        child: Text(
                          Get.find<TweetsController>()
                              .tweetList
                              .value!
                              .results[widget.id]
                              .text,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Row(
                      children: [Text('Time '), Text('Date '), Text('Veiws')],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Row(
                      children: [Text('Time '), Text('Date '), Text('Veiws')],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(Icons.recycling),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(Icons.heart_broken),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(Icons.download),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: new BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        //           CircleAvatar(
                        //   backgroundImage: NetworkImage(),
                        //   radius: 24,
                        // ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Tweet your reply",
                          style: TextStyle(
                              color: Color.fromARGB(255, 112, 112, 112),
                              fontSize: 20),
                        )
                      ],
                    ),
                    Text(_replyController
                        .replyList.value!.replies[0].user.username)
                  ],
                ),
              ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
