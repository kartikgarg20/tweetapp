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
                child: Expanded(
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
                      const Divider(
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
                      const Divider(
                        color: Colors.black,
                        thickness: 0.1,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          //           CircleAvatar(
                          //   backgroundImage: NetworkImage(),
                          //   radius: 24,
                          // ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Tweet your reply",
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 112, 112),
                                fontSize: 20),
                          ),
                          const Spacer(),
                          Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'Reply',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.1,
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:
                              _replyController.replyList.value!.replies.length,
                          itemBuilder: (BuildContext context, index) {
                            var reply =
                                _replyController.replyList.value!.replies;
                            return replyTile(index, reply);
                          }),
                      Text(_replyController
                          .replyList.value!.replies[0].user.username)
                    ],
                  ),
                ),
              ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget replyTile(int index, var reply) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * (0.025)),
        child: InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(reply[index].user.profilePicUrl),
                radius: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          reply[index].user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                        ),
                        Text('@${reply[index].user.username}'),
                        Spacer(),
                        Icon(
                          Icons.more_horiz,
                          color: Color.fromARGB(255, 63, 63, 63),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => ReplyPage(id: index));
                      },
                      child: Container(
                        child: Text(reply[index].text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(Icons.chat),
                          Text(reply[index].replyCount.toString()),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.recycling),
                          Text(reply[index].retweetCount.toString()),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.heart_broken),
                          Text(reply[index].favoriteCount.toString()),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.download_outlined),
                          Text('100'),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.4,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
