import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/sizeconfig.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 68.0),
            child: CircleAvatar(
              radius: SizeConfig.blockSizeHorizontal! * 13,
              child: Icon(
                Icons.person,
                size: SizeConfig.blockSizeHorizontal! * 11,
              ),
            ),
          ),
          styleButton(context, "kunal", Icons.person),
          styleButton(context, "+917353***", Icons.phone),
          styleButton(context, "ku***@****.com", Icons.mail_outline),
          Center(
            child: Container(
              width: SizeConfig.screenWidth! / 2.2,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 7,
                margin: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("LOGOUT",
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          )),
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal! * 4,
                        child: Icon(
                          Icons.logout,
                          size: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget styleButton(BuildContext context, String title, IconData iconData) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
    elevation: 7,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal! * 5,
              )),
          CircleAvatar(
            radius: SizeConfig.blockSizeHorizontal! * 3,
            child: Icon(
              iconData,
              size: SizeConfig.blockSizeHorizontal! * 3,
            ),
          ),
        ],
      ),
    ),
  );
}
