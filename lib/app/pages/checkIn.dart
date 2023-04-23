// import 'package:flutter/material.dart';
// import 'package:todolist/app/pages/viewDay.dart';
// import 'package:todolist/app/pages/viewMonth.dart';
// import 'package:todolist/app/pages/viewYear.dart';

// // class CheckIn extends StatefulWidget {
// //   const CheckIn({super.key});

// //   @override
// //   State<CheckIn> createState() => _CheckInState();
// // }

// // class _CheckInState extends State<CheckIn> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //         // 切换的数量
// //         length: 2,
// //         child: Scaffold(
// //             appBar: AppBar(
// //               title: Text('CheckIn'),
// //               centerTitle: true,
// //               bottom: TabBar(
// //                 indicatorSize: TabBarIndicatorSize.label,
// //                 tabs: <Widget>[
// //                   Tab(text: "签到"),
// //                   Tab(text: "月视图"),
// //                   Tab(text: "年视图")
// //                 ],
// //               ),
// //             ),
// //             // 标签页所对应的页面
// //             body: TabBarView(
// //               children: <Widget>[DayView(), MonthView(), YearView()],
// //             )));
// //   }
// // }

// class CheckIn extends StatelessWidget {
//   const CheckIn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         // 切换的数量
//         length: 3,
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text('CheckIn'),
//               centerTitle: true,
//               bottom: TabBar(
//                 indicatorSize: TabBarIndicatorSize.label,
//                 tabs: <Widget>[
//                   Tab(text: "签到"),
//                   Tab(text: "月视图"),
//                   Tab(text: "年视图")
//                 ],
//               ),
//             ),
//             // 标签页所对应的页面
//             body: TabBarView(
//               children: <Widget>[
//                 DayView(),
//                 MonthView(),
//                 YearView(),
//               ],
//             )));
//   }
// }
