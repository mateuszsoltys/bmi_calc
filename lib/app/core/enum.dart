enum Lang {
  pl,
  gb,
}

enum Units {
  iso('kg / cm'),
  imp('lbs / \"');

  const Units(this.label);
  final String label;
}
