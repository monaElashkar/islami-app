import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {

   const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45),
            child: Image.asset(
              "assets/images/radio_pic.png",
              height: 222,
              width: 412,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            "إذاعة القرآن الكريم ",
            style: TextStyle(
              fontSize: 25,
              color: const Color(0XFF242424),
              fontWeight: FontWeight.w600,
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 25, top: 60),
            height: 41,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.skip_previous,
                  color: Color(0xFFB7935F),
                  size: 50,
                ),
                Icon(
                  Icons.play_arrow_sharp,
                  color: Color(0xFFB7935F),
                  size: 50,
                ),
                Icon(
                  Icons.skip_next,
                  color: Color(0xFFB7935F),
                  size: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
