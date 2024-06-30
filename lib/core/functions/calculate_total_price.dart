sealed class CalculateTotalPrice {
  static double calculateTotalPrice(List<String> prices) {
    double total = 0.0;

    for (String price in prices) {
      // Convert the string price to a double
      double numericPrice = double.tryParse(price) ?? 0.0;

      // Add the numeric price to the total
      total += numericPrice;
    }

    return total;
  }
}
