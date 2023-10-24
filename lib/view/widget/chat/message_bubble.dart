import 'package:flutter/cupertino.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/services/services.dart';
import 'package:get/get.dart';
class MessageBubble extends StatefulWidget {
  final Map message;
  final int User_id;
   const MessageBubble({Key? key, required this.message, required this.User_id}) : super(key: key);

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool showTimeS = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: widget.User_id == widget.message['sender_id'] ?  Alignment.centerRight: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  showTimeS = !showTimeS;
                });
              },
              child: Container(
                width: 300,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.User_id == widget.message['sender_id'] ? AppColor.secondColor :AppColor.thirdColor
                ),
                child: Text(
                  widget.message['message'],
                  style: TextStyle(
                      fontSize: 18,
                      height: 1.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8,),
            if(showTimeS) ...[ Padding(
              padding: widget.User_id == widget.message['sender_id'] ? const EdgeInsets.only(right: 12) : const EdgeInsets.only(left: 12),
              child: Text('04:22 Am',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            ]
          ],
        ),
      ),
    );
  }
}
