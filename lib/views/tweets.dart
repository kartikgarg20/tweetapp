import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twitter_app/controllers/tweets_controller.dart';
import 'package:twitter_app/views/replies.dart';

class Tweets extends StatefulWidget {
  Tweets({Key? key}) : super(key: key);

  @override
  State<Tweets> createState() => _TweetsState();
}

class _TweetsState extends State<Tweets> {
  TweetsController _tweetsController = Get.put(TweetsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_sharp),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Raj Kumar ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Icon(
                              Icons.verified,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text('30.6k Tweets'),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(45)),
                      child: const Center(
                        child: Text(
                          "Follow",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => _tweetsController.isLoading.isTrue
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
                  : ListView.builder(
                      itemCount:
                          _tweetsController.tweetList.value!.results.length,
                      itemBuilder: (BuildContext context, int index) {
                        var tweets = _tweetsController.tweetList.value!.results;
                        return tweetTile(index, tweets);
                      }),
            ))
          ],
        ),
      ),
    );
  }

  Widget tweetTile(int index, var tweets) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * (0.025)),
        child: InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(tweets[index].user.profilePicUrl),
                radius: 24,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(tweets[index].user.name),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                        ),
                        Text('@${tweets[index].user.username}')
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => ReplyPage(id: index));
                      },
                      child: Container(
                        child: Text(tweets[index].text),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
