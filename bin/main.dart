import 'package:args/args.dart';

import 'beecrowd/loops/below_the_main_diagonal.dart';
import 'beecrowd/matrix/array_1_2_3.dart';
import 'beecrowd/matrix/square_matrix_I.dart';
import 'beecrowd/matrix/square_matrix_II.dart';
import 'beecrowd/matrix/square_matrix_III.dart';
import 'beecrowd/summing_consecutive_integers.dart';
import 'consumption.dart';
import 'beecrowd/coordinates.dart';
import 'beecrowd/exceeding_z.dart';
import 'beecrowd/highest_and_position.dart';
import 'long_words.dart';
import 'team.dart';

import 'dart:io';

const String version = '0.0.1';

void main() {
  array123();
}
/*{
  List<int> nS = [];
  int input;
  do {
    input = int.parse(stdin.readLineSync()!);
    nS.add(input);
  } while (input != 0);

  for (int n = 0; n < nS.length; n++) {
    final nList = List.generate(n, (index) => 0);
    List<List<int>> mat = List.generate(n, (index) => [...nList]);

    final levels = (n / 2 + 0.5) ~/ 1;

    for (int level = 0; level < levels; level++) {
      for (int column = level; column < n - level; column++) {
        // topLeft to right
        mat[level][column] = level + 1;
        // topLeft to down
        mat[column][level] = level + 1;
        // bottomLeft to right
        mat[n - 1 - level][column] = level + 1;
        // topRight to down
        mat[column][n - 1 - level] = level + 1;
      }
    }

    String list = "";
    for (List row in mat) {
      for (int i = 0; i < row.length; i++) {
        if (i == 0) {
          list += "  ${row[i]}";
        } else {
          list += "   ${row[i]}";
        }
      }
      print(list);
      list = "";
    }

    print("");
  }
}*/
