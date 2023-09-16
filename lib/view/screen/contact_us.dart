import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Contuct Us"),

      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                onTap: ()async{
                  launchUrl(Uri.parse("tel:+201026993056"));
                },
                title: Text("Phone"),
                trailing:Icon(Foundation.telephone),
              ),
            ),
            // Card(
            //   child: ListTile(
            //     onTap: ()async{
            //       await launchUrl(Uri.parse("https://wa.me/+201026993056"));
            //     },
            //     title: Text("Whats App"),
            //     trailing:Icon(MaterialCommunityIcons.whatsapp,color: Colors.green,),
            //   ),
            // ),
          ],
        )

      ),
    );
  }
}
void launchWhatsApp() async {
  String phoneNumber = "+20 1026993056"; // Replace with the phone number you want to open in WhatsApp
  String message = "Hello, let's chat!"; // Replace with the default message you want to send

  String url = "https://wa.me/$phoneNumber";
  // String url = "https://wa.me/$phoneNumber/?text=${Uri.parse(message)}";

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
