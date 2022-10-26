// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_cubit.dart';

@immutable
class CoreState {
  final Lang language;
  final Units unit;
  final Gender gender;
  final int? age;
  final int height;
  final int weight;
  final double bmi;
  final int? minValHeight;
  final int? maxValHeight;
  final int? minValWeight;
  final int? maxValWeight;
  final WeightGroup? weightGroup;
  final List? minRangeWidget;
  CoreState({
    required this.language,
    required this.unit,
    required this.gender,
    this.age,
    required this.height,
    required this.weight,
    required this.bmi,
    this.minValHeight,
    this.maxValHeight,
    this.minValWeight,
    this.maxValWeight,
    this.weightGroup,
    this.minRangeWidget,
  });

  CoreState copyWith({
    Lang? language,
    Units? unit,
    Gender? gender,
    int? age,
    int? height,
    int? weight,
    double? bmi,
    int? minValHeight,
    int? maxValHeight,
    int? minValWeight,
    int? maxValWeight,
    WeightGroup? weightGroup,
    List? minRangeWidget,
  }) {
    return CoreState(
      language: language ?? this.language,
      unit: unit ?? this.unit,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bmi: bmi ?? this.bmi,
      minValHeight: minValHeight ?? this.minValHeight,
      maxValHeight: maxValHeight ?? this.maxValHeight,
      minValWeight: minValWeight ?? this.minValWeight,
      maxValWeight: maxValWeight ?? this.maxValWeight,
      weightGroup: weightGroup ?? this.weightGroup,
      minRangeWidget: minRangeWidget ?? this.minRangeWidget,
    );
  }
}
