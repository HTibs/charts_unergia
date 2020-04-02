class ManHours {
  final String value;
  final String name;
  final String color;

  ManHours(this.name, this.value, this.color);

  ManHours.from(Map<String, dynamic> map)
      : assert(map['value'] != null),
        assert(map['name'] != null),
        assert(map['color'] != null),
        value = map['value'],
        name = map['name'],
        color = map['color'];

  @override
  String toString() => "Records<$name, $value, $color>";
}
