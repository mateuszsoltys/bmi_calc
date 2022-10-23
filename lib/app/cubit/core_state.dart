// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_cubit.dart';

@immutable
class CoreState {
  final Lang language;
  final Units unit;

  CoreState({required this.language, required this.unit});

  CoreState copyWith({
    Lang? language,
    Units? unit,
  }) {
    return CoreState(
      language: language ?? this.language,
      unit: unit ?? this.unit,
    );
  }
}
