// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/classes/marked_date.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/classes/event_list.dart';
// import 'package:salam/core/constants/colors.dart';
// import 'package:salam/screens/custom_widget/custom_button.dart';

// class Calenderbottomsheet extends StatefulWidget {
//   const Calenderbottomsheet({super.key});
//   @override
//   State<Calenderbottomsheet> createState() => _CalenderbottomsheetState();
// }

// class _CalenderbottomsheetState extends State<Calenderbottomsheet> {
//   Set<DateTime> selectedDays = {};
//   bool isDaySelected(DateTime date) {
//     return selectedDays.contains(date);
//   }

//   EventList<Event> _markedDatesMap = EventList<Event>(events: {});
//   void _handleDayPressed(DateTime date, List<Event> events) {
//     setState(() {
//       if (selectedDays.contains(date)) {
//         selectedDays.remove(date);
//       } else {
//         selectedDays.add(date);
//       }
//       _updateMarkedDatesMap(); // Update marked dates whenever the selection is changed
//     });
//   }

//   void _updateMarkedDatesMap() {
//     Map<DateTime, List<Event>> eventsMap = {};
//     for (var date in selectedDays) {
//       eventsMap[date] = [
//         Event(
//           date: date,
//           icon: Container(
//             decoration: BoxDecoration(
//               color: Color(
//                   0xff39E272), // Set green color for selected date background
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//       ];
//     }
//     print('Updated _markedDatesMap: $eventsMap');
//     setState(() {
//       _markedDatesMap = EventList<Event>(events: eventsMap);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: 1.5,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(0xffFFF6EE),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 20),
//                 Text(
//                   'Calendar',
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Select when would you like to pay your \ninstalment',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       color: Colors.black.withOpacity(0.70)),
//                 ),
//                 SizedBox(height: 10),
//                 Divider(
//                   thickness: 1,
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 350,
//                   decoration: BoxDecoration(
//                       color: Color(0xffFFF6EE),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: CalendarCarousel<Event>(
//                     prevDaysTextStyle: TextStyle(color: Colors.black),
//                     onDayPressed: _handleDayPressed,
//                     markedDatesMap: _markedDatesMap,
//                     selectedDayButtonColor: Color(0xffE4633E),
//                     headerTextStyle: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.black),
//                     weekendTextStyle: TextStyle(color: Colors.black),
//                     iconColor: Colors.black,
//                     selectedDateTime: DateTime.now(),
//                     daysTextStyle: TextStyle(color: Colors.black),
//                     weekdayTextStyle: TextStyle(color: Colors.black),
//                     weekDayFormat: WeekdayFormat.short,
//                     markedDateShowIcon: true,
//                     customDayBuilder: (
//                       // Use customDayBuilder instead of cellBuilder
//                       bool isSelectable,
//                       int index,
//                       bool isSelectedDay,
//                       bool isToday,
//                       bool isPrevMonthDay,
//                       TextStyle textStyle,
//                       bool isNextMonthDay,
//                       bool isThisMonthDay,
//                       DateTime day,
//                     ) {
//                       final events = _markedDatesMap.getEvents(day);
//                       final isSelected = selectedDays.contains(day);
//                       final textColor = isSelected || isToday
//                           ? Colors.white
//                           : textStyle.color;
//                       final backgroundColor =
//                           isSelected ? Color(0xffE4633E) : Colors.transparent;
//                       return GestureDetector(
//                         onTap: () => _handleDayPressed(day, events),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: backgroundColor,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Center(
//                             child: Text(
//                               day.day.toString(),
//                               style: TextStyle(
//                                 color: textColor,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 CustomButton(
//                   text: 'Confirm Repayment Date',
//                   color: PrimaryColor,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
