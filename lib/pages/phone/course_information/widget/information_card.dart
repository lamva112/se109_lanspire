import 'package:flutter/material.dart';
import '../../../../data/models/class_time.dart';
import '../../../../resources/colors.dart';

class InformationCard extends StatelessWidget {
  final String? leading;
  final String? trailing;
  final List<ClassTimes>? listTrailing;
  final bool isList;

  const InformationCard({
    Key? key,
    this.leading,
    this.trailing,
    this.listTrailing,
    required this.isList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            leading ?? "",
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: isList == false
              ? Text(
                  trailing ?? "",
                  style: TextStyle(
                    color: AppColors.primaryGay,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    listTrailing?.length ?? 0,
                    (index) => Text(
                      "${listTrailing?[index].timeFrame?.startingTime?.substring(0, listTrailing?[index].timeFrame?.startingTime?.length ?? 0 - 3) ?? ""} - ${listTrailing?[index].timeFrame?.endingTime?.substring(0, listTrailing?[index].timeFrame?.endingTime?.length ?? 0 - 3)} | ${getDayOfWeek(listTrailing?[index].dayOfWeek ?? 1)}",
                      style: TextStyle(
                        color: AppColors.primaryGay,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
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
