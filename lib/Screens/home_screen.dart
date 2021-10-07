import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/sizeconfig.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var objcopy;
  getdata() async {
    var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var obj = json.decode(res.body);
    objcopy = obj;
    print("hello check now " + obj.length.toString());
    return obj;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: const Color(0xDCDADA),
      child: FutureBuilder(
        future: getdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: SizeConfig.blockSizeHorizontal! * 100,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          shadowColor: Colors.black26,
                          child: Column(children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.safeBlockHorizontal! * 1),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            snapshot.data[index]["image"]
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 8,
                                          child: Text(snapshot.data[index]
                                                  ["category"]
                                              .toString())),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Image.network(
                                snapshot.data[index]["image"].toString(),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Card(
                                elevation: 14,
                                margin: EdgeInsets.zero,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.safeBlockHorizontal! * 1),
                                  child: Row(
                                    children: const <Widget>[
                                      Expanded(
                                          flex: 2,
                                          child: IconButton(
                                            onPressed: null,
                                            icon: Icon(
                                                Icons.favorite_border_outlined),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: IconButton(
                                            onPressed: null,
                                            icon: Icon(Icons.chat),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: IconButton(
                                            onPressed: null,
                                            icon: Icon(Icons
                                                .mobile_screen_share_rounded),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ));
                });
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
