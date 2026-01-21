import 'package:crypto_track/core/connectivity/ui/connectivity_banner.dart';
import 'package:crypto_track/features/coin/bloc/coin_bloc.dart';
import 'package:crypto_track/features/coin/ui/bottom_container.dart';
import 'package:crypto_track/features/coin/ui/fl_chart_widget.dart';
import 'package:crypto_track/features/coin/ui/percentage_change_widget.dart';
import 'package:crypto_track/features/coin/ui/top_heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinPage extends StatefulWidget {
  final String coinId;
  const CoinPage({super.key, required this.coinId});


  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {

  @override
  void initState() {
    context.read<CoinBloc>().add(CoinInitialEvent(coinId: widget.coinId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(widget.coinId.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ConnectivityBanner(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopHeadingWidget(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: 300,
                      child: const FlChartWidget(),
                    ),
                  ),
                  const Divider(),
                  const PercentageChangeWidget(),
                  const Divider(height: 50,),
                  const Text('Info',),
                  const BottomContainer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
