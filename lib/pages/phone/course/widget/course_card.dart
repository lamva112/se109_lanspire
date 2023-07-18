import 'package:flutter/material.dart';
import '../../../../data/data.dart';
import '../../../../data/models/class_time.dart';
import '../../../../resources/colors.dart';
import '../../../../enums.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/ink_well_wrapper.dart';

class CourseCard extends StatelessWidget {
  final Classes? classes;
  final VoidCallback? onTap;
  const CourseCard({Key? key, this.onTap, this.classes}) : super(key: key);

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
      onTap: ()=>onTap?.call(),
        paddingChild: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    classes?.className??"",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryBubbles,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.primaryCyan,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 26,
                  ),
                  child: Text(
                    getCourseStatus(CourseStatus.in_process, context),
                    style: TextStyle(
                      color: AppColors.primaryTrueBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Assets.images.png.watch.image(width: 24, height: 24),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "12/20",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Poppins', color: AppColors.primaryBlack),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Assets.images.png.calendar.image(width: 24, height: 24),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "${classes?.startDate??""} - ${classes?.endDate??""}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Poppins', color: AppColors.primaryBlack),
                ),
              ],
            ),
            Wrap(
              children: [
                ...List.generate(classes?.classTimes?.length??0, (index) => timeWidget(classes?.classTimes?[index]))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget timeWidget(ClassTimes? time) {
  return Row(
    children: [
      Assets.images.png.watch.image(width: 24, height: 24),
      Text(
        "${getDayOfWeek(time?.dayOfWeek??7)}:",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryBlack,
        ),
      ),
      Text(
        "${time?.timeFrame?.startingTime} - ${time?.timeFrame?.endingTime}",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryBlack,
        ),
      ),
    ],
  );
}

String getCourseStatus(CourseStatus status, context) {
  switch (status) {
    case CourseStatus.in_process:
      return S.of(context).in_process;
    case CourseStatus.finish:
      return S.of(context).finish;
  }
}
String getDayOfWeek(int day) {
  switch (day) {
    case 1:
      return "Mon";
    case 2:
      return "Tue";
    case 3:
      return "Wed";
    case 4:
      return "Thu";
    case 5:
      return "Fri";
    case 6:
      return "Sat";
    case 7:
      return "Sun";
  }
  return "Mon";
}
