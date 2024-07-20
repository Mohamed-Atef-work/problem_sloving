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

  for (int n in matrixLengths) {
    List<List<int>> matrix = createMatrix(n);
    printMatrix(matrix);
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
  return matrixLengths;
}

List<List<int>> createMatrix(int n) {
  final nList = List.generate(n, (index) => 0);
  List<List<int>> matrix = List.generate(n, (index) => [...nList]);

  final levels = (n / 2 + 0.5) ~/ 1;

  for (int level = 0; level < levels; level++) {
    for (int column = level; column < n - level; column++) {
      // topLeft to right
      matrix[level][column] = level + 1;
      // topLeft to down
      matrix[column][level] = level + 1;
      // bottomLeft to right
      matrix[n - 1 - level][column] = level + 1;
      // topRight to down
      matrix[column][n - 1 - level] = level + 1;
    }
  }
  return matrix;
}

void printMatrix(List<List<int>> matrix) {
  String list = "";
  for (List row in matrix) {
    for (int element in row) {
      list += "   $element";
    }
    print(list);
    list = "";
  }

  print("");
}
