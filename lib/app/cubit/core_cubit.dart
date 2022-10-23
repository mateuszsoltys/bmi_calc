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
            unit:
                Units.values.byName(_preferences.getString('unit') ?? 'iso')));

  // Future<void> start() async {
  //   emit(CoreState(language: Lang.pl, unit: Units.iso));
  // }

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
}
