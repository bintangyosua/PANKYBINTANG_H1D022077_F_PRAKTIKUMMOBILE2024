import 'dart:math';

void main() {
  // Simple Linear Regression
  List<double> x = [1, 2, 3, 4, 5];
  List<double> y = [2, 4, 6, 8, 10];
  SimpleLinearRegression s = SimpleLinearRegression(x, y);
  print("Slope: ${s.slope}");
  print("Intercept: ${s.intercecpt}");
  print("R^2: ${s.r2}");
}

class SimpleLinearRegression {
  double slope = 0.0;
  double intercecpt = 0.0;
  double r2 = 0.0;

  SimpleLinearRegression(List<double> x, List<double> y) {
    double sumX = 0.0;
    double sumY = 0.0;
    double sumXY = 0.0;
    double sumXX = 0.0;
    double sumYY = 0.0;

    int n = y.length;

    for (int i = 0; i < y.length; i++) {
      sumX += x[i];
      sumY += y[i];
      sumXY += x[i] * y[i];
      sumXX += x[i] * x[i];
      sumYY += y[i] * y[i];
    }

    this.slope = (n * sumXY - sumX * sumY) / (n * sumXX - sumX * sumX);
    this.intercecpt = (sumY - this.slope * sumX) / n;
    this.r2 = pow(
            (n * sumXY - sumX * sumY) /
                sqrt((n * sumXX - sumX * sumX) * (n * sumYY - sumY * sumY)),
            2)
        .toDouble();
  }
}
