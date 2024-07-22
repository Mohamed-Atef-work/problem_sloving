import 'dart:io';

void squareMatrixII() {
  List<int> nS = [];
  int input;
  do {
    input = int.parse(stdin.readLineSync()!);
    nS.add(input);
  } while (input != 0);

  for (int i = 0; i < nS.length - 1; i++) {
    final nList = List.generate(nS[i], (index) => 0);
    List<List<int>> mat = List.generate(nS[i], (index) => [...nList]);

    for (int row = 0; row < nS[i]; row++) {
      int value = 1;

      for (int column = row; column < nS[i]; column++) {
        mat[row][column] = value;
        mat[column][row] = value;

        value++;
      }
    }

    String matrixRow = "";
    for (List row in mat) {
      for (int i in row) {
        matrixRow += "  $i";
      }
      print(matrixRow);
      matrixRow = "";
    }
    if (nS[i] != nS[nS.length - 2]) {
      print("");
      print("-----------------------> ${nS[i]}");
    }
  }
}

void squareMatrixIIII() {
  int n;
  do {
    n = int.parse(stdin.readLineSync()!);
    final nList = List.generate(n, (index) => 0);
    List<List<int>> mat = List.generate(n, (index) => [...nList]);

    for (int row = 0; row < n; row++) {
      int value = 1;

      for (int column = row; column < n; column++) {
        mat[row][column] = value;
        mat[column][row] = value;

        value++;
      }
    }

    String matrixRow = "";
    for (List row in mat) {
      for (int i in row) {
        matrixRow += "  $i";
      }
      print(matrixRow);
      matrixRow = "";
    }

    print("");
  } while (n != 0);
}
