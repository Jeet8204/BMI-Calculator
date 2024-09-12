import "dart:math";

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _BMI = 0.00;
  String calculateBMI() {
    _BMI = weight / pow(height / 100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult() {
    if (_BMI >= 25) {
      return "OverWeight";
    } else if (_BMI > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretation() {
    if (_BMI >= 25) {
      return "You have higher than your normal body weight, Try to excercise more!!!";
    } else if (_BMI > 18.5) {
      return "You have a normal body weight, Good Job!!";
    } else {
      return "You have lower than your normal body weight, You can eat more!";
    }
  }
}
