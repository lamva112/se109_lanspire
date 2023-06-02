import 'package:flutter/material.dart';
import '../../../../resources/colors.dart';

class InformationCard extends StatelessWidget {
  final String? leading;
  final String? trailing;
  final List<String>? listTrailing;
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
                      listTrailing?[index] ?? "",
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
