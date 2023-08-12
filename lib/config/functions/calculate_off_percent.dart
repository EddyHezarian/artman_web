double calculateOffPercent(double salePrice, double regularPrice) {
  double percentOff = ((regularPrice - salePrice) / regularPrice) * 100;
  return percentOff;
}
