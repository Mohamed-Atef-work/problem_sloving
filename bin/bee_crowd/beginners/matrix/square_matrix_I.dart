/*Write a program that read an integer number N (0 ≤ N ≤ 100) that correspond to the order of a Bidimentional array of integers,
and build the Array according to the above example.

Input
The input consists of several integers numbers, one per line, corresponding to orders from arrays to be built.
The end of input is indicated by zero (0).

Output
For each integer number of input, print the corresponding array according to the example.
(the values of the arrays must be formatted in a field of size 3 right justified and separated by a space.
None space must be printed after the last character of each row of the array.
A blank line must be printed after each array.

Sample Input	Sample Output
1
2
3
4
5
0

  1

  1   1
  1   1

  1   1   1
  1   2   1
  1   1   1

  1   1   1   1
  1   2   2   1
  1   2   2   1
  1   1   1   1

  1   1   1   1   1
  1   2   2   2   1
  1   2   3   2   1
  1   2   2   2   1
  1   1   1   1   1*/

import 'dart:io';

void squareMatrixI() {
  List<int> matrixLengths = userInput();

  List<List<String>> matrix;

  for (int i = 0; i < matrixLengths.length; i++) {
    matrix = createMatrix(matrixLengths[i]);
    matrix = removeSpaces(matrix);
    printMatrix(matrix);
    if (i != matrixLengths.length - 1) {
      print("");
    }
  }
}

List<int> userInput() {
  List<int> matrixLengths = [];
  print("Enter Ns Of The Matrix...");
  int input;
  do {
    input = int.parse(stdin.readLineSync()!);
    matrixLengths.add(input);
  } while (input != 0);
  matrixLengths.remove(0);
  return matrixLengths;
}

List<List<String>> createMatrix(int n) {
  final nList = List.generate(n, (index) => " ");
  List<List<String>> matrix = List.generate(n, (index) => [...nList]);

  final rows = (n / 2 + 0.5) ~/ 1;
  String value;
  for (int row = 0; row < rows; row++) {
    for (int column = row; column < n - row; column++) {
      value = "   ${row + 1}";
      // topLeft to right
      matrix[row][column] = value;
      // topLeft to down
      matrix[column][row] = value;
      // bottomLeft to right
      matrix[n - 1 - row][column] = value;
      // topRight to down
      matrix[column][n - 1 - row] = value;
    }
  }
  return matrix;
}

List<List<String>> removeSpaces(List<List<String>> matrix) {
  for (int row = 0; row < matrix.length; row++) {
    matrix[row][0] = "  1";
  }
  return matrix;
}

void printMatrix(List<List<String>> matrix) {
  String list = "";
  for (List row in matrix) {
    for (String element in row) {
      list += element;
    }
    print(list);
    list = "";
  }
}
