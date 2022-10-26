import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum WeightGroup { underweigt, normal, overweight, adiposity, severeadiposity }

extension WeightGroupColors on WeightGroup {
  static const Map<WeightGroup, Color> colors = {
    WeightGroup.underweigt: Colors.blue,
    WeightGroup.normal: Colors.green,
    WeightGroup.overweight: Colors.yellow,
    WeightGroup.adiposity: Colors.red,
    WeightGroup.severeadiposity: Colors.brown
  };

  Color get color {
    final Color? colorValue = colors[this];
    if (colorValue == null) {
      return Colors.transparent;
    }
    return colorValue;
  }
}

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
