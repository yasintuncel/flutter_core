String getFractionalNumber(num number, {fractionCount = 2}) {
  return number.toDouble().toStringAsFixed(fractionCount);
}
