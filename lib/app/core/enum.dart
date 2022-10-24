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

enum Gender {
  man,
  woman,
}
