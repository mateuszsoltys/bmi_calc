// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "infoHeight": "Choose your height",
  "infoWeight": "Choose your weight",
  "history": "History",
  "infoAge": "Your age",
  "infoLanguage": "Choose app language",
  "infoUnit": "Units",
  "txtBMI": "BMI, also known as the body mass index or the Quetelet index,\nis a parameter developed in 1832 by a Belgian statistician, Adolf Quetelet.\nIt allows you to assess whether our body weight is correct. BMI parameters slightly differ due to\non gender and age. The BMI parameter is used for adults."
};
static const Map<String,dynamic> pl = {
  "infoHeight": "Twoja wysokość",
  "infoWeight": "Twoja waga",
  "history": "Historia",
  "infoAge": "Podaj wiek",
  "infoLanguage": "Język aplikacji",
  "infoUnit": "Jednostki",
  "txtBMI": "BMI (ang. Body Mass Index), nazywany także indeksem masy ciała lub wskaźnikiem Queteleta,\nto parametr opracowany w 1832 roku przez belgijskiego statystyka, Adolfa Queteleta.\nPozwala on ocenić, czy masa naszego ciała jest prawidłowa. Parametry BMI delikatnie różnią się ze względu \nna płeć i wiek. Parametr BMI stosuje się dla osób dorosłych."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "pl": pl};
}
