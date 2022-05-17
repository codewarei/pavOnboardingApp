import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widgets/nav_drawer_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  List<_SalesData> data = [
    _SalesData('Complete', 305),
    _SalesData('Waiting', 28),
    _SalesData('Incomplete', 34),

  ];



  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PAV Dashboard'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ContainedTabBarView(
        tabs: const [
          Text('Survey'),
          Text('Users'),
        ],
        tabBarProperties: TabBarProperties(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          indicator: ContainerTabIndicator(
            radius: BorderRadius.circular(16.0),
            color: Colors.deepOrange,
            borderWidth: 2.0,
            borderColor: Colors.black,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[400],
        ),
        views: [
          SfCircularChart(
              title: ChartTitle(text: 'Survey Statistics '),
              legend: Legend(
                  isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                RadialBarSeries<GDPData, String>(
                    dataSource: _chartData,
                    xValueMapper: (GDPData data, _) => data.continent,
                    yValueMapper: (GDPData data, _) => data.gdp,
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        borderWidth: 1.0,
                        useSeriesColor: true),
                    enableTooltip: true,
                    maximumValue: 4000)
              ]),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Users analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Users',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}


List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData('No it does not make a difference', 1600),
    GDPData('Maybe not sure', 2490),
    GDPData('Yes it is very important', 2900),

  ];
  return chartData;
}

class GDPData {
  final String continent;
  final int gdp;
  GDPData(this.continent, this.gdp);
}
