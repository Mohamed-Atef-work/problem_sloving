/*
Optical Reader

Professor John decided to apply only multiple-choice tests to his students.
In each test, each question will have five alternatives (A, B, C, D and E),
and the teacher will distribute one answer sheet for each student. At the end of the test,
the answer sheets will be scanned and processed digitally to obtain the test score for each student.
Initially, he asked a nephew, who knows computer programming,
to write a program to extract the alternatives marked by the students in the answer sheets.
The nephew wrote a good piece of software, but he couldn't finish it because he needs to study for the ICPC contest.


During processing, the answer sheets are scanned in gray levels between 0 (full black) and 255 (total white).
After detecting the position for the five rectangles corresponding to each of the alternatives of a question,
the software calculates the average pixel gray level for each rectangle, returning an integer value corresponding to each alternative.
If the rectangle was filled properly the average value is zero (all black).
If the rectangle was left blank the average value is 255 (white total).
Thus, ideally, if the average values for each alternative of a question are (255, 0, 255, 255, 255),
we know that the student has marked alternative B for that question.
However, as answer sheets are processed individually,
the average gray level for a completely filled rectangle is not necessarily 0 (may be higher),
and the value for a rectangle not filled is not necessarily 255 (may be less).
Professor John determined that rectangle average gray levels would be divided into two classes:
those with values equal or lower to 127 are considered black and those with values higher than 127 will be considered white.

Obviously, not necessarily all questions of all sheets are marked correctly.
It can happen that a student makes a mistake and marks more than one alternative for the same question,
or does not mark any alternative. In such cases, the answer to the question should be disregarded.

Now, professor John needs a volunteer to write one program that,
given the average gray level values of the five rectangles corresponding to the alternatives of a question,
determines which alternative was marked, or whether the answer to the question should be disregarded.

Input
The input contains several test cases.
The first line of a test case contains an integer N indicating the number of questions in the answer sheet (1 ≤ N ≤ 255).
Each of the N following lines describes the response to a question and contains five integers A, B, C, D and E,
indicating the values of average gray levels for each alternative (0 ≤ A, B, C, D, E ≤ 255).

The last test case is followed by a line containing only a number zero.

Output
For each input test case, your program must print N lines, each line corresponding to a question.
If the answer to the question was correctly filled in the answer sheet,
the line should contain the alternative selected (‘A’,‘B’, ‘C’, ‘D’ or ‘E’).
Otherwise, the line should contain the character ‘*’ (asterisk).

Input Sample	Output Sample
3
0 255 255 255 255
255 255 255 255 0
255 255 127 255 255
4
200 200 200 0 200
200 1 200 200 1
1 2 3 4 5
255 5 200 130 205
0

A
E
C
D
*
*
B
*/
import 'dart:io';

void opticalReaders() {
  List<String> alternatives = [];
  int numberOfLines = 1;

  while (numberOfLines != 0) {
    numberOfLines = int.parse(stdin.readLineSync()!);
    final List<String> testCase = doTestCase(numberOfLines);
    alternatives.addAll(testCase);
  }

  for (String element in alternatives) {
    print(element);
  }
}

List<String> doTestCase(int numberOfLines) {
  List<String> alternatives = [];
  String alt;

  for (int i = 0; i < numberOfLines; i++) {
    alt = doLine();
    alternatives.add(alt);
  }
  return alternatives;
}

String doLine() {
  int alt = 0;
  int white = 0;
  int black = 0;
  int element = 0;

  List<String> lineSplit = [];
  final String line = stdin.readLineSync()!;
  lineSplit = line.split(" ");

  for (int j = 0; j < lineSplit.length; j++) {
    element = int.parse(lineSplit[j]);

    if (element > 127) {
      white++;
    } else {
      alt = j;
      black++;
    }
  }

  if (white == 5 || black > 1) {
    return "*";
  } else {
    return letter(alt);
  }
}

String letter(int num) {
  if (num == 0) {
    return "A";
  } else if (num == 1) {
    return "B";
  } else if (num == 2) {
    return "C";
  } else if (num == 3) {
    return "D";
  } else {
    return "E";
  }
}
