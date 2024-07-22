/*
  Read an uppercase character that indicates an operation that will be performed in an array M[12][12].
Then, calculate and print the sum or average considering only that numbers that are below of the main diagonal of the array,
like shown in the following figure (green area).

  Input
The first line of the input contains a single uppercase character O ('S' or 'M'),
indicating the operation Sum or Average (Média in portuguese) to be performed with the elements of the array.
Follow 144 floating-point numbers of the array.

  Output
Print the calculated result (sum or average), with one digit after the decimal point.*/
import 'dart:io';

void belowTheDiagonal() {
  print("Enter [S] for sum ,or Sum or [M] Average");
  final String sumOrAverage = stdin.readLineSync()!;

  List<List<double>> array = makeArray();

  double total = getTotal(array);

  if (sumOrAverage == "S") {
    print(total);
  } else {
    final average = total / 66;
    print(average.toStringAsFixed(1));
  }
}

double getTotal(List<List<double>> array) {
  double total = 0;

  for (int r = 0; r < 12; r++) {
    print("Calc Row $r ......................");
    for (int c = 0; c < r; c++) {
      print("Calc Row $r Column $c ............");

      total += array[r][c];
    }
  }
  return total;
}

List<List<double>> makeArray() {
  List<List<double>> array =
      List.generate(12, (index) => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  for (int r = 0; r < 12; r++) {
    print("Row $r ......................");
    for (int c = 0; c < 12; c++) {
      print("Column $c In The Row $r......");
      final double item = double.parse(stdin.readLineSync()!);
      array[r][c] = item;
    }
  }
  return array;
}
