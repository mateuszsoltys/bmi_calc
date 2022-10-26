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
  "infoAge": "Age",
  "infoLanguage": "Choose app language",
  "infoUnit": "Units",
  "txtBMI": "BMI, also known as the body mass index or the Quetelet index,\nis a parameter developed in 1832 by a Belgian statistician, Adolf Quetelet.\nIt allows you to assess whether our body weight is correct. BMI parameters slightly differ due to\non gender and age. The BMI parameter is used for adults.",
  "underweigt": "Underweight",
  "normal": "Normal",
  "overweight": "Overweight",
  "adiposity": "Adiposity",
  "severeadiposity": "Severe adiposity",
  "infoBmi0": "Welcome in BMI CALC \nEnter your own data to calculate BMI",
  "titleSettings": "Settings"
};
static const Map<String,dynamic> pl = {
  "infoHeight": "Twoja wysokość",
  "infoWeight": "Twoja waga",
  "history": "Historia",
  "infoAge": "Wiek",
  "infoLanguage": "Język aplikacji",
  "infoUnit": "Jednostki",
  "txtBMI": "BMI (ang. Body Mass Index), nazywany także indeksem masy ciała lub wskaźnikiem Queteleta,\nto parametr opracowany w 1832 roku przez belgijskiego statystyka, Adolfa Queteleta.\nPozwala on ocenić, czy masa naszego ciała jest prawidłowa. Parametry BMI delikatnie różnią się ze względu \nna płeć i wiek. Parametr BMI stosuje się dla osób dorosłych.",
  "underweigt": "Niedowaga",
  "normal": "W normie",
  "overweight": "Nadwaga",
  "adiposity": "Otyłość",
  "severeadiposity": "Ciężka otyłość",
  "infoBmi0": "Witaj w BMI CALC! \nWprowadź swoje dane do kalkulatora",
  "titleSettings": "Ustawienia"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "pl": pl};
}
