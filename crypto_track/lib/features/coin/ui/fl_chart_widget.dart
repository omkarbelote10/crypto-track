import 'package:crypto_track/features/coin/bloc/coin_bloc.dart';
import 'package:crypto_track/features/coin/bloc/coin_state.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlChartWidget extends StatelessWidget {
  const FlChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinBloc, CoinDetailsState>(
      builder: (context, state) {
        if(state.isChartLoading ){
          return const Center(child: CircularProgressIndicator());
        }
        else if(state.chartError != null){
          return const Center(child: Text('Could not load chart'));
        }
        else{
          final listOfFlSpots = state.listOfFlSpots!;

          final double startPrice = listOfFlSpots.first.y;
          final double endPrice = listOfFlSpots.last.y;
          final bool isUp = endPrice >= startPrice;

          final Color lineColor = isUp ? Colors.green : Colors.red;
          final List<Color> gradientColors = isUp
              ? [Colors.green, Colors.green.withValues(alpha: 0.0)]
              : [Colors.red, Colors.red.withValues(alpha: 0.0)];

          return LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: listOfFlSpots,
                    isCurved: true,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                    color: lineColor,
                    belowBarData:BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: gradientColors,
                      ),
                    ),
                  )
                ],
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
              )
          );
        }
      },
    );
  }
}
