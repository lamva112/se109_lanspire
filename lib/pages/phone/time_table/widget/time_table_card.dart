import 'package:flutter/material.dart';
import 'package:se109_lanspire/resources/colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/ink_well_wrapper.dart';

class TimeTableCard extends StatelessWidget {
  final String? roomName;
  final String? time;
  final String? className;

  const TimeTableCard({Key? key, this.roomName, this.time, this.className}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 22,left: 6,right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: InkWellWrapper(
        margin: EdgeInsets.symmetric(horizontal: 6),
        paddingChild: EdgeInsets.only(top: 4,left: 8,right: 8,bottom: 9),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              className ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Assets.images.png.location.image(),
                      Text(roomName??"",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Assets.images.png.clockCircular.image(color: AppColors.primaryBlueBerry),
                      Text(time??"",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
