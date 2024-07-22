/*
Read 100 integer numbers. Print the highest read value and the input position.

Input
The input file contains 100 distinct positive integer numbers.

Output
Print the highest number read and the input position of this value, according to the given example.*/
import 'dart:io';

void highestAndPosition() {
  int highest = 0;
  int position = 0;
  for (int i = 0; i <= 5; i++) {
    final num = int.parse(stdin.readLineSync()!);
    if (num > highest) {
      highest = num;
      position = i;
    }
  }
  print(highest);
  print(position + 1);
}

void calc() {
  print("Enter a value for A:");
  double a = double.parse(stdin.readLineSync()!);

  double n;
  do {
    print("Enter a positive value for N:");
    n = double.parse(stdin.readLineSync()!);
  } while (n <= 0);

  double sum = 0;
  for (int i = 0; i < n; i++) {
    sum += a + i;
  }

  print("Sum of $n numbers starting from $a (inclusive): $sum");
}
