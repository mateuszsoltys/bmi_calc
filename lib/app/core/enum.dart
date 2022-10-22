enum Lang {
  pl,
  gb,
}

enum Unit {
  iso('Metric'),
  imp('Imperial');

  const Unit(this.label);
  final String label;
}
