class PieChart {
  final String value;

  PieChart(this.value);

  PieChart.fromMap(Map<String, dynamic> map)
      : assert(map['value'] != null),
        value = map['value'];

  @override
  String toString() => "Record<$value>";
}
