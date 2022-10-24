import 'package:bloc/bloc.dart';
import 'package:bmi_calc/app/core/enum.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  final SharedPreferences _preferences;
  CoreCubit(this._preferences)
      : super(CoreState(
          language:
              Lang.values.byName(_preferences.getString('language') ?? 'pl'),
          unit: Units.values.byName(_preferences.getString('unit') ?? 'iso'),
          gender:
              Gender.values.byName(_preferences.getString('gender') ?? 'man'),
          age: _preferences.getInt('age') ?? null,
          height: _preferences.getInt('height') ?? 170,
          weight: _preferences.getInt('weight') ?? 80,
        ));

  Future<void> changeUnit() async {}

  Future<void> changeAndSaveLanguage(unit) async {
    if (unit == Lang.pl) {
      emit(state.copyWith(language: Lang.pl));
      _preferences.setString('language', 'pl');
    } else {
      emit(state.copyWith(language: Lang.gb));
      _preferences.setString('language', 'gb');
    }
  }

  Future<void> saveAge(String val) async {
    final newVal = int.tryParse(val);
    _preferences.setInt('age', newVal!);
    emit(state.copyWith(age: newVal));
  }

  Future<void> saveHeight(int val) async {
    _preferences.setInt('height', val);
    emit(state.copyWith(height: val));
  }

  Future<void> saveWeight(int val) async {
    _preferences.setInt('weight', val);
    emit(state.copyWith(weight: val));
  }
}
