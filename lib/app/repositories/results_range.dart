import '../core/enum.dart';

Map<String, dynamic> bmiTable = {
  'a': {
    'minage': 18,
    'minbmi': {
      Gender.man: {0: 0, 1: 20, 2: 25, 3: 30, 4: 40},
      Gender.woman: {0: 0, 1: 19, 2: 24, 3: 29, 4: 39},
    }
  },
  'b': {
    'minage': 25,
    'minbmi': {
      Gender.man: {0: 0, 1: 21, 2: 26, 3: 31, 4: 41},
      Gender.woman: {0: 0, 1: 20, 2: 25, 3: 30, 4: 40},
    }
  },
  'c': {
    'minage': 35,
    'minbmi': {
      Gender.man: {0: 0, 1: 22, 2: 27, 3: 32, 4: 42},
      Gender.woman: {0: 0, 1: 21, 2: 26, 3: 31, 4: 41},
    }
  },
  'd': {
    'minage': 45,
    'minbmi': {
      Gender.man: {0: 0, 1: 23, 2: 28, 3: 33, 4: 43},
      Gender.woman: {0: 0, 1: 22, 2: 27, 3: 32, 4: 42},
    }
  },
  'e': {
    'minage': 55,
    'minbmi': {
      Gender.man: {0: 0, 1: 24, 2: 29, 3: 34, 4: 44},
      Gender.woman: {0: 0, 1: 23, 2: 28, 3: 33, 4: 43},
    }
  },
  'f': {
    'minage': 65,
    'minbmi': {
      Gender.man: {0: 0, 1: 25, 2: 30, 3: 35, 4: 45},
      Gender.woman: {0: 0, 1: 24, 2: 29, 3: 34, 4: 44},
    }
  },
};

String? getAgeCategory(
  int? age,
) {
  if (age == null) {
    return null;
  } else {
    Iterable<String> ageKeys = bmiTable.keys.toList().reversed;
    for (String ageKey in ageKeys) {
      if (bmiTable[ageKey]['minage'] <= age) {
        return ageKey;
      }
    }
    return null;
  }
}

WeightGroup getWeightGroup(double bmi, String ageCategory, Gender gender) {
  Iterable<int> groupKeys =
      bmiTable[ageCategory]['minbmi'][gender].keys.toList().reversed;
  for (int groupKey in groupKeys) {
    if (bmi >= bmiTable[ageCategory]['minbmi'][gender][groupKey]) {
      return WeightGroup.values[groupKey];
    }
  }
  return WeightGroup.underweigt;
}

List<double> getMinValues(String ageCategory, Gender gender) {
  List<double> listMin = [];
  for (WeightGroup weightGroup in WeightGroup.values) {
    listMin.add(
        bmiTable[ageCategory]['minbmi'][gender][weightGroup.index].toDouble());
  }
  return listMin;
}
