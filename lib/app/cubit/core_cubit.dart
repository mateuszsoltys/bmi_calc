import 'package:bloc/bloc.dart';
import 'package:bmi_calc/app/core/enum.dart';
import 'package:meta/meta.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreState(language: Lang.pl, unit: Units.iso));

  Future<void> start() async {
    emit(CoreState(language: Lang.pl, unit: Units.iso));
  }

  Future<void> changeUnit() async {}
}
