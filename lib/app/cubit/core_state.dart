// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_cubit.dart';

@immutable
class CoreState {
  final Lang language;
  final Units unit;
  final Gender gender;
  final int? age;

  CoreState(
      {required this.language,
      required this.unit,
      required this.gender,
      required this.age});

  CoreState copyWith({
    Lang? language,
    Units? unit,
    Gender? gender,
    int? age,
  }) {
    return CoreState(
        language: language ?? this.language,
        unit: unit ?? this.unit,
        gender: gender ?? this.gender,
        age: age ?? this.age);
  }
}
