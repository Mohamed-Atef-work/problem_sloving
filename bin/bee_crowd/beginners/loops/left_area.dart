/*
* left area
*
* Read an uppercase character that indicates an operation that will be performed in an array M[12][12].
*  Then, calculate and print the sum or average considering only that numbers that are included in the green area of this array,
*  like shown in the following figure.

Input
The first line of the input contains a single uppercase character O ('S' or 'M'),
*  indicating the operation Sum or Average (Média in portuguese) to be performed with the elements of the array.
*  Follow 144 floating-point numbers of the array.

Output
Print the calculated result (sum or average), with one digit after the decimal point.
* */
import 'dart:io';

void leftArea() {
  final String sumOrAverage = stdin.readLineSync()!;

  List<List<double>> array =
      List.generate(12, (index) => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  for (int r = 0; r < 12; r++) {
    for (int c = 0; c < 12; c++) {
      final double item = double.parse(stdin.readLineSync()!);
      array[r][c] = item;
    }
  }

  double total = 0;

  for (int r = 0; r < 6; r++) {
    for (int c = 0; c < r; c++) {
      total += array[r][c];
    }
  }

  for (int r = 6; r < 11; r++) {
    for (int c = 0; c < 11 - r; c++) {
      total += array[r][c];
    }
  }

  if (sumOrAverage == "S") {
    print(total.toStringAsFixed(1));
  } else {
    final average = (total / 30).toStringAsFixed(1);
    print(average);
  }
}
