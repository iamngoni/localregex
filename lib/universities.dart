class UniversitiesRegex {
  /// Harare Institute Of Technology
  static RegExp HIT = RegExp(r'H{1}[0-9]{6}[A-Z]{1}');
}

class IsStudent {
  bool HIT;

  IsStudent({required this.HIT});
}
