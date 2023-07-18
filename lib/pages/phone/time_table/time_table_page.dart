import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se109_lanspire/data/data.dart';
import 'package:se109_lanspire/resources/resources.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../blocs/blocs.dart';
import '../../../constants.dart';
import '../../../core/base/base.dart';
import 'widget/time_table_card.dart';

class TimeTablePage extends StatefulWidget {
  final TimeTableBloc bloc;

  const TimeTablePage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends BaseState<TimeTablePage, TimeTableBloc> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlueBerry,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          localization.time_table,
          style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryWhite,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Classes>?>(
          stream: bloc.examStream,
          builder: (context, snapshot) {
            List<Classes>? listClass = snapshot.data??[];
            List<Classes>? filterClass = getFilterList(listClass,_selectedDay);
            return Column(
              children: [
                TableCalendar(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: _focusedDay,
                  calendarFormat: CalendarFormat.week,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        print(getDayOfWeekNumber(selectedDay));
                        filterClass = getFilterList(listClass,_selectedDay);
                        //_focusedDay = focusedDay;
                      });
                    }
                  },
                ),
                ...List.generate(filterClass?.length??0, (index) => TimeTableCard(
                  roomName: filterClass?[index].room,
                  time: "${filterClass?[index].classTimes?[0].timeFrame?.startingTime??""} - ${filterClass?[index].classTimes?[0].timeFrame?.endingTime??""}",
                  className: filterClass?[index].className,
                )),
              ],
            );
          }
        ),
      ),
    );
  }

  List<Classes>? getFilterList(List<Classes>? listClass,DateTime selectedDate){
    List<Classes>? a = [];
     int selectedDayOfWeek = getDayOfWeekNumber(selectedDate);
     listClass?.forEach((element) {
       element.classTimes?.forEach((e) {
         if(e.dayOfWeek == selectedDayOfWeek){
           a.add(element);
         }
       });
     });
     return a;
  }

  int getDayOfWeekNumber(DateTime dateTime) {
    return dateTime.weekday;
  }


  @override
  TimeTableBloc get bloc => widget.bloc;
}
