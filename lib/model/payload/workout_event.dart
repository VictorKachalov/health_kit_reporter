class WorkoutEvent {
  final String type;
  final num startTimestamp;
  final num endTimestamp;
  final num duration;
  final Harmonized harmonized;

  const WorkoutEvent(
    this.type,
    this.startTimestamp,
    this.endTimestamp,
    this.duration,
    this.harmonized,
  );

  Map<String, dynamic> get map => {
        'type': type,
        'startTimestamp': startTimestamp,
        'endTimestamp': endTimestamp,
        'duration': duration,
        'harmonized': harmonized.map,
      };

  WorkoutEvent.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        startTimestamp = json['startTimestamp'],
        endTimestamp = json['endTimestamp'],
        duration = json['duration'],
        harmonized = Harmonized.fromJson(json['harmonized']);

  static List<WorkoutEvent> collect(List<dynamic> list) {
    final samples = <WorkoutEvent>[];
    for (final Map<String, dynamic> map in list) {
      final sample = WorkoutEvent.fromJson(map);
      samples.add(sample);
    }
    return samples;
  }
}

class Harmonized {
  const Harmonized(
    this.value,
    this.metadata,
  );

  final int value;
  final Map<String, dynamic> metadata;

  Map<String, dynamic> get map => {
        'value': value,
        'metadata': metadata,
      };

  Harmonized.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        metadata = json['metadata'];
}
