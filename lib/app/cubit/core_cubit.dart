import 'package:bloc/bloc.dart';
import 'package:bmi_calc/app/core/enum.dart';
import 'package:bmi_calc/app/repositories/results_range.dart';
import 'package:easy_localization/easy_localization.dart';
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
          age: _preferences.getInt('age'),
          height: _preferences.getInt('height') ?? 170,
          weight: _preferences.getInt('weight') ?? 80,
          bmi: _preferences.getDouble('bmi') ?? 0.0,
          minValHeight: _preferences.getInt('minValHeight') ?? 100,
          maxValHeight: _preferences.getInt('maxValHeight') ?? 200,
          minValWeight: _preferences.getInt('minValWeight') ?? 30,
          maxValWeight: _preferences.getInt('maxValWeight') ?? 200,
        ));

  Future<void> changeUnit(unit) async {
    if (unit == Units.iso) {
      final isoMinH = state.minValHeight! * 2.54;
      final isoMinW = state.minValWeight! * 0.4536;
      final isoMaxH = state.maxValHeight! * 2.54;
      final isoMaxW = state.maxValWeight! * 0.4536;

      final isoHeight = state.height * 2.54;
      final isoWeight = state.weight * 0.4536;

      _preferences.setInt('minValHeight', isoMinH.round());
      _preferences.setInt('maxValHeight', isoMaxH.round());
      _preferences.setInt('minValWeight', isoMinW.round());
      _preferences.setInt('maxValWeight', isoMaxW.round());
      _preferences.setInt('height', isoHeight.round());
      _preferences.setInt('weight', isoWeight.round());

      emit(state.copyWith(
          unit: unit,
          minValHeight: isoMinH.round(),
          minValWeight: isoMinW.round(),
          maxValHeight: isoMaxH.round(),
          maxValWeight: isoMaxW.round(),
          height: isoHeight.round(),
          weight: isoWeight.round()));
    }

    if (unit == Units.imp) {
      final impMinH = state.minValHeight! * 0.39370;
      final impMinW = state.minValWeight! * 2.2046;
      final impMaxH = state.maxValHeight! * 0.39370;
      final impMaxW = state.maxValWeight! * 2.2046;

      final impHeight = state.height * 0.39370;
      final impWeight = state.weight * 2.2046;

      _preferences.setInt('minValHeight', impMinH.round());
      _preferences.setInt('maxValHeight', impMaxH.round());
      _preferences.setInt('minValWeight', impMinW.round());
      _preferences.setInt('maxValWeight', impMaxW.round());
      _preferences.setInt('height', impHeight.round());
      _preferences.setInt('weight', impWeight.round());

      emit(state.copyWith(
          unit: unit,
          minValHeight: impMinH.round(),
          minValWeight: impMinW.round(),
          maxValHeight: impMaxH.round(),
          maxValWeight: impMaxW.round(),
          height: impHeight.round(),
          weight: impWeight.round()));
    }
  }

  Future<void> changeAndSaveLanguage(Lang unit) async {
    emit(state.copyWith(language: unit));
    _preferences.setString('language', unit.name);
  }

  Future<void> changeAndSaveGender(Gender unit) async {
    emit(state.copyWith(gender: unit));
    _preferences.setString('gender', unit.name);
    calculateResult();
    bmiWeightGroup();
  }

  Future<void> saveAge(String val) async {
    final int? newVal = int.tryParse(val);
    if (newVal != null) {
      _preferences.setInt('age', newVal);
      emit(state.copyWith(age: newVal));
      calculateResult();
      bmiWeightGroup();
    }
  }

  Future<void> saveHeight(int val) async {
    _preferences.setInt('height', val);
    emit(state.copyWith(
      height: val,
    ));
    calculateResult();
    bmiWeightGroup();
  }

  Future<void> saveWeight(int val) async {
    _preferences.setInt('weight', val);
    emit(state.copyWith(weight: val));
    calculateResult();
    bmiWeightGroup();
  }

  Future<void> calculateResult() async {
    // height [m]
    final height = state.height * state.unit.heightConv;
    // weight [kg]
    final weight = state.weight * state.unit.weightConv;

    final powHeight = height * height;
    double bmi;
    bmi = weight / powHeight;
    _preferences.setDouble('bmi', bmi);
    emit(state.copyWith(bmi: bmi));
  }

  Future<void> bmiWeightGroup() async {
    String? ageCategory = getAgeCategory(state.age);
    if (ageCategory != null) {
      WeightGroup group = getWeightGroup(state.bmi, ageCategory, state.gender);
      List<double> minRangeList = getMinValues(ageCategory, state.gender);
      emit(state.copyWith(weightGroup: group, minRangeWidget: minRangeList));
    }
  }

  Future start() async {
    bmiWeightGroup();
  }
}
