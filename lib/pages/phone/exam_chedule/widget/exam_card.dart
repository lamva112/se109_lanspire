import 'package:flutter/material.dart';
import '../../../../data/data.dart';
import '../../../../resources/colors.dart';
import '../../../../widgets/ink_well_wrapper.dart';
import '../../../../gen/assets.gen.dart';

class ExamCard extends StatelessWidget {
  final Exams? exam;
  final VoidCallback? onTap;

  const ExamCard({Key? key, this.exam, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,top: 7,bottom: 7),
            child: Text(
              exam?.testDate ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: AppColors.primaryBlack,
              ),
            ),
          ),
          Column(
            children: List.generate(
              1,
              (index) => Container(
                margin: EdgeInsets.only(top: 7,left: 8,right: 8),
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
                  Assets.images.png.approval.image(),
                  SizedBox(width: 7,),
                  Text(
                    exam?.examName??"",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Assets.images.png.format.image(),
                  SizedBox(width: 7,),
                  Text(
                    exam?.classes?.className??"",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Assets.images.png.format.image(),
                  SizedBox(width: 7,),
                  Text(
                    exam?.testTime??"",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
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
