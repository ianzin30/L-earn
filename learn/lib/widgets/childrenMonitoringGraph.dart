import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChildrenMonitoringGraph extends StatelessWidget {
  final List<Children> children;
  final Children? selectedChild;

  ChildrenMonitoringGraph({
    required this.children,
    this.selectedChild,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de cores predefinidas.
    List<Color> predefinedColors = [
  Colors.green as Color,
  Colors.blue as Color,
  Colors.yellow as Color,
  Colors.red as Color,
  Colors.purple as Color,
  Colors.orange as Color,
];


    // Determina as cores com base no número de crianças.
    List<Color> colors;
    if (selectedChild == null) {
      colors = [Colors.grey, ...predefinedColors.take(children.length)];
    } else {
      int index = children.indexOf(selectedChild!);
      colors = [index != -1 ? predefinedColors[index % predefinedColors.length] : Colors.orange];
    }
    
    List<String> names = selectedChild == null
      ? ['Todos'] + children.map((child) => child.name.split(' ')[0]).toList()
      : [selectedChild!.name.split(' ')[0]];

    List<List<_ChartData>> chartData = [];
    if (selectedChild == null) {
      // Dados de "Todos" + dados individuais de cada criança.
      chartData.add(_createChartDataForAll(children));
      chartData.addAll(children.map((child) => _createChartData(child.xpPerDay)));
    } else {
      // Apenas dados da criança selecionada.
      chartData.add(_createChartData(selectedChild!.xpPerDay));
    }

    // O maior valor de XP para escalar o eixo Y.
    //double maxYValue = chartData.expand((x) => x).map((data) => data.y).reduce(max) + 100;

    return SfCartesianChart(
      legend: Legend(
        isVisible: true, overflowMode: LegendItemOverflowMode.scroll,alignment: ChartAlignment.near, textStyle:TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold
        ) ),
      primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(color: Colors.black.withOpacity(0.1)),),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 1000, interval: 200, majorGridLines: MajorGridLines(color: Colors.black.withOpacity(0.1)),),
      series: List.generate(
        chartData.length,
        (index) => AreaSeries<_ChartData, String>(
          dataSource: chartData[index],
          color: colors[index % colors.length].withOpacity(0.7),
          name: names[index],
          borderDrawMode: BorderDrawMode.top,
          borderColor: colors[index % colors.length].withOpacity(0.5),
          borderWidth: 1,
          legendIconType: LegendIconType.circle,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          gradient: LinearGradient(
            colors: [colors[index % colors.length].withOpacity(0), colors[index % colors.length].withOpacity(0.8)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        
      ),
    );
  }

    List<_ChartData> _createChartDataForAll(List<Children> children) {
    List<int> totals = List.filled(7, 0);
    for (var child in children) {
      for (int i = 0; i < child.xpPerDay.length; i++) {
        totals[i] += child.xpPerDay[i];
      }
    }
    return List.generate(totals.length, (i) => _ChartData(_getDayLabel(i), totals[i].toDouble()));
  }

  List<_ChartData> _createChartData(List<int> xpPerDay) {
    return List.generate(xpPerDay.length, (i) => _ChartData(_getDayLabel(i), xpPerDay[i].toDouble()));
  }

  String _getDayLabel(int index) {
    List<String> days = ['seg', 'ter', 'qua', 'qui', 'sex', 'sáb', 'dom'];
    return days[index];
  }
}


class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}