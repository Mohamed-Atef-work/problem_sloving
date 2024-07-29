/*
Number Frequence

In this problem your job is to read some positive and integer numbers and print how many times each number appears in the input,
you must write each of the distinct values that appear in the input, ordering by ascending value.

Input
The input contains only one test case.
The first line of input contains one integer N,
which indicates the quantity of numbers that will be read to X (1 ≤ X ≤ 2000) in the sequence.
Each number don't appears more than 20 times in the problem input.

Output
Print the output according to the example provided below,
indicating how many times each number appears in the input file, by ascending order of value.

Input Sample	Output Sample
7
8
10
8
260
4
10
10

4 aparece 1 vez(es)
8 aparece 2 vez(es)
10 aparece 3 vez(es)
260 aparece 1 vez(es)
*/

import 'dart:io';

void numberFrequency() {
  final List<int> numbers = input();
  final List<int> noRepeated = removeRepeated(numbers);
  final List<int> sorted = sort(noRepeated);
  frequency(numbers, sorted);
  print(numbers);
  print(noRepeated);
  print(sorted);
}

List<int> input() {
  List<int> numbers = [];
  int inputs = int.parse(stdin.readLineSync()!);
  do {
    int num = int.parse(stdin.readLineSync()!);
    numbers.add(num);
    inputs--;
  } while (inputs != 0);
  return numbers;
}

List<int> removeRepeated(List<int> list) {
  List<int> edited = [];
  bool exists = false;
  for (int element in list) {
    exists = isExisted(element, edited);
    if (!exists) {
      edited.add(element);
    }
  }
  return edited;
}

bool isExisted(int num, List<int> thisList) {
  bool exists = false;

  for (int element in thisList) {
    if (num == element) {
      exists = true;
    }
  }
  return exists;
}

List<int> sort(List<int> noRepeated) {
  List<int> toSort = [...noRepeated];
  List<int> sorted = [];
  int smallest = 0;

  for (int i = 0; i < noRepeated.length; i++) {
    smallest = toSort.first;

    for (int element in toSort) {
      if (element < smallest) {
        smallest = element;
      }
    }

    toSort.remove(smallest);
    sorted.add(smallest);
  }
  return sorted;
}

void frequency(List<int> numbers, List<int> sorted) {
  int frequency = 0;
  for (int element in sorted) {
    frequency = 0;
    for (int num in numbers) {
      if (element == num) {
        frequency++;
      }
    }
    print("$element aparece $frequency vez(es)");
  }
}
