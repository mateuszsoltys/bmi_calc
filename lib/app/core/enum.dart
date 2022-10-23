enum Lang {
  pl,
  gb,
}

enum Units {
  iso('Metric'),
  imp('Imperial');

  const Units(this.label);
  final String label;
}
