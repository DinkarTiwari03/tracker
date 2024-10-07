import 'package:expense_tracker/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  const MyBarGraph({
    super.key, 
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {
    // initialize the bar data
    BarData myBarData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount, 
      wedAmount: wedAmount,
      thuAmount: thuAmount, 
      friAmount: friAmount,
      satAmount: satAmount,
      );
      myBarData.initializeBarData();
     return BarChart(
        BarChartData(
          maxY: 100,
          minY: 0,
          titlesData: const FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
               // getTitlesWidget: getBottonTitles,
              ),

            ),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: myBarData.barData
          .map((data)=> BarChartGroupData(
            x: data.x,

            barRods: [
              BarChartRodData(
              toY: data.y,
              color: Colors.grey,
              width: 16,
              borderRadius: BorderRadius.circular(3),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: maxY,
                color: Colors.grey[200],
              ),
              ),
            ],
          ))
          .toList(),
     ));
  }
}

// Widget getBottonTitles(double value, TitleMeta meta){
//   const style= TextStyle( 
//     color: Colors.grey,
//     fontWeight:Fontweight.bold 
//     );
// }