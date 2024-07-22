/*
Summing Consecutive Integers

  Write an algorithm to read a value A and a value N.
Print the sum of N numbers from A (inclusive). While N is negative or ZERO, a new N (only N) must be read.
All input values are in the same line.

Input
  The input contains only integer values, can be positive or negative.

Output
  The output contains only an integer value.

Input Sample
3 2
3 -1 0 -2 2

Output Sample
7
7
*/

import 'dart:io';

void summingConsecutiveIntegers() {
  final String input = stdin.readLineSync()!;
  final List<String> splitInput = input.split(" ");
  List<int> integers = [];
  int integer;

  for (String i in splitInput) {
    integer = int.parse(i);
    if (integer > 0 && integers.length < 2) {
      integers.add(integer);
    }
    if (integers.length >= 2) {
      break;
    }
  }

  final a = integers.first;
  final n = integers.last;

  int sum = 0;

  for (int i = 0; i < n; i++) {
    sum = sum + a + i;
  }
  print(sum);
}

void sSequence() {
  double s = 0;
  for (int i = 1; i <= 100; i++) {
    s = s + 1 / i;
  }
  print(s.toStringAsFixed(2));
}

void sSequenceII() {
  double s = 1;
  for (int i = 3, j = 2; i <= 39; i += 2, j *= 2) {
    s = s + i / j;
  }
  print(s.toStringAsFixed(2));
}
