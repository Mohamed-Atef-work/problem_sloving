/*
Read an integer N that is the size of a bidimentional array that must be printed like the given example.

Input
The input contains many test cases and ends with EOF. Each test case consist in a integer number N (3 ≤ N < 70), that indicates the size (lines and columns) of a bidimentional array that must be printed.

Output
For each N read, print the output according to the given example.

Sample Input	Sample Output
4
7

1332
3123
3213
2331
1333332
3133323
3313233
3332333
3323133
3233313
2333331
 */

/*
4
7

1 3 3 2
3 1 2 3
3 2 1 3
2 3 3 1

1 3 3 3 3 3 2
3 1 3 3 3 2 3
3 3 1 3 2 3 3
3 3 3 2 3 3 3
3 3 2 3 1 3 3
3 2 3 3 3 1 3
2 3 3 3 3 3 1
*/

import 'dart:io';

void array123() {
  List<int> nS = [];
  int input;

  for (int i = 0; i < 2; i++) {
    input = int.parse(stdin.readLineSync()!);
    nS.add(input);
  }

  for (int n in nS) {
    final nList = List.generate(n, (index) => 3);
    List<List<int>> mat = List.generate(n, (index) => [...nList]);

    for (int axis = 0; axis < n; axis++) {
      mat[axis][axis] = 1;
      mat[axis][n - 1 - axis] = 2;
    }

    String matrixRow = "";
    for (List row in mat) {
      for (int i in row) {
        matrixRow += "$i";
      }
      print(matrixRow);
      matrixRow = "";
    }
  }
}
