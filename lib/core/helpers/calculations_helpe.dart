class CalculationsHelper {
  static double mlToOz(double ml) {
    // Conversion factor from milliliters to fluid ounces
    const double mlToOzFactor = 0.033814;

    // Perform the conversion
    double oz = ml * mlToOzFactor;

    // Round the result to two decimal places
    oz = double.parse((oz).toStringAsFixed(2));

    return oz;
  }
}
