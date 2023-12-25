import 'package:finance_manager/data/model/AddData.dart';
import 'package:finance_manager/data/model/utility.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  int indexx;
  Chart({Key? key, required this.indexx}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<AddData>? a;
  bool b = true;
  bool j = true;
  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();

        j = false;
        break;
      default:
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: const Color.fromARGB(255, 14, 10, 218),
            width: 3,
            dataSource: <SalesData>[
              ...List.generate(time(a!, b ? true : false).length, (index) {
                return SalesData(
                    j
                        ? b
                            ? a![index].datetime.hour.toString()
                            : a![index].datetime.day.toString()
                        : a![index].datetime.month.toString(),
                    b
                        ? index > 0
                            ? time(a!, true)[index] + time(a!, true)[index - 1]
                            : time(a!, true)[index]
                        : index > 0
                            ? time(a!, false)[index] +
                                time(a!, false)[index - 1]
                            : time(a!, false)[index]);
              })
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}



// child: SfCircularChart(
      //   legend: Legend(
      //     isVisible: true,
      //     overflowMode: LegendItemOverflowMode.scroll,
      //     textStyle: const TextStyle(color: Colors.black),
      //   ),
      //   tooltipBehavior: TooltipBehavior(enable: true),
      //   series: <CircularSeries<SalesData, String>>[
      //     DoughnutSeries<SalesData, String>(
      //       dataSource: <SalesData>[
      //         ...List.generate(time(a!, b ? true : false).length, (index) {
      //           return SalesData(
      //               j
      //                   ? b
      //                       ? a![index].datetime.hour.toStringAsFixed(2)
      //                       : a![index].datetime.day.toStringAsFixed(2)
      //                   : a![index].datetime.month.toStringAsFixed(2),
      //               b
      //                   ? index > 0
      //                       ? time(a!, true)[index] + time(a!, true)[index - 1]
      //                       : time(a!, true)[index]
      //                   : index > 0
      //                       ? time(a!, false)[index] +
      //                           time(a!, false)[index - 1]
      //                       : time(a!, false)[index]);
      //         }),
      //       ],
      //       xValueMapper: (SalesData sales, _) => sales.year,
      //       yValueMapper: (SalesData sales, _) => sales.sales,
      //       dataLabelSettings: const DataLabelSettings(
      //         isVisible: true,
      //         textStyle: TextStyle(
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),