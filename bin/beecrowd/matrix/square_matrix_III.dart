/*Square Matrix III

Write a program that read an integer number N (0 ≤ N ≤ 15) that correspont to the order of a bidimentional array of integers,
and build the array according to the above example.

Input
The input consists of several integers numbers, one per line, corresponding to orders from arrays to be built.
The end of input is indicated by zero (0).

Output
For each integer number of input, print the corresponding array according to the example.
The values of the array must be formatted in a field of size T right justified and separated by a space,
where T is equal to the number of digits of the biggest number in the array.
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

1 2
2 4

 1  2  4
 2  4  8
 4  8 16

 1  2  4  8
 2  4  8 16
 4  8 16 32
 8 16 32 64

  1   2   4   8  16
  2   4   8  16  32
  4   8  16  32  64
  8  16  32  64 128
 16  32  64 128 256
 */

import 'dart:io';
import 'dart:math';

void squareMatrixIII() {
  List<int> sizes = input();

  List<List<String>> matrix;

  for (int i = 0; i < sizes.length - 1; i++) {
    matrix = makeMatrix(sizes[i]);
    presentMat(matrix);
  }
}

List<List<String>> makeMatrix(int size) {
  final nList = List.generate(size, (index) => " ");
  List<List<String>> matrix = List.generate(size, (index) => [...nList]);

  String value;
  int difference;
  final int length = pow(4, size - 1).toString().length;

  for (int row = 0, out = 1; row < size; row++, out *= 2) {
    for (int column = 0, ins = out; column < size; column++, ins *= 2) {
      value = "$ins";
      difference = length - value.length;
      if (column != 0) {
        difference++;
      }
      matrix[row][column] = spaces(difference) + value;
    }
  }
  return matrix;
}

List<int> input() {
  List<int> sizes = [];
  int input;
  do {
    input = int.parse(stdin.readLineSync()!);
    sizes.add(input);
  } while (input != 0);
  return sizes;
}

void presentMat(List<List<String>> matrix) {
  String matrixRow = "";
  for (List row in matrix) {
    for (String i in row) {
      matrixRow += i;
    }
    print(matrixRow);
    matrixRow = "";
  }
  print("");
}

String spaces(int num) => " " * num;
