import 'package:flutter/material.dart';

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        leading: const Icon(Icons.camera_alt_outlined),
        title: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Image.asset("assets/logo/Instagram Logo.png"),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/icons/IGTV.png")),
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset("assets/icons/message.png")),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: .5))),
              child: Row(
                  children:
                      // profile circle
                      List.generate(
                          20,
                          (index) => Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    margin: const EdgeInsets.all(7),
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xffFBAA47),
                                          Color(0xffD91A46),
                                          Color(0xffA60F93),
                                        ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60))),
                                    child: Center(
                                      child: Container(
                                          height: 65,
                                          width: 65,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(60))),
                                          child:
                                              Image.asset("assets/profie.png")),
                                    ),
                                  ),
                                  const Text("Name")
                                ],
                              ))),
            ),
          ),
          //Afrutheen
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                child: Image.asset("assets/profie.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My name"),
                    Text("State,Country"),
                  ],
                ),
              ),
              Spacer(),
              Container(
                  padding: EdgeInsets.only(right: 10),
                  // color: Colors.red,
                  child: const Icon(Icons.more_horiz)),
            ],
          ),
          Image.asset("assets/post.png"),
          //vishnu
          Container(
            margin: EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //     border: Border(top: BorderSide(color: Colors.grey, width: 1))),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(Icons.favorite_outline)),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(Icons.comment_outlined)),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(Icons.telegram_outlined)),
                Spacer(),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),

          //srivatsav
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
            child: Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                      image: DecorationImage(
                          image: AssetImage("assets/post.png"))),
                  // child: Image.asset("assets/post.png"),
                ),
                Flexible(
                  child: Text(
                    "Liked by craig_love and 44,686 others \n joshua_l The game in Japan was amazing and I want to share some photos",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          Spacer(),
          //tajudeen
          Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 1))),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.home)),
                Spacer(),
                Container(height: 30, width: 30, child: Icon(Icons.search)),
                Spacer(),
                Icon(Icons.add_box),
                Spacer(),
                Icon(Icons.favorite_border),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 25),
                  child: Image.asset(
                    "assets/profie.png",
                    height: 30,
                    width: 30,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
