enum Lang {
  pl,
  gb,
}

enum Units {
  iso('kg / cm'),
  imp('lbs / in');

  const Units(this.label);
  final String label;
}

extension ConverionFactors on Units {
  static const Map<Units, double> heightConvValues = {
    Units.iso: 0.01, // cm na m
    Units.imp: 0.0254 // in na m
  };
  static const Map<Units, double> weightConvValues = {
    Units.iso: 1, // kg
    Units.imp: 0.4535 // lbs na kg
  };

  double get heightConv {
    final double? heightConvValue = heightConvValues[this];
    if (heightConvValue == null) {
      return 0;
    } else {
      return heightConvValue;
    }
  }

  double get weightConv {
    final double? weightConvValue = weightConvValues[this];
    if (weightConvValue == null) {
      return 0;
    } else {
      return weightConvValue;
    }
  }
}

enum Gender {
  man,
  woman,
}

enum AgeGroup {
  a,
  b,
  c,
  d,
  e,
  f,
}
