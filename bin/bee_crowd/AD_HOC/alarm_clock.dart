/*
Alarm Clock

Daniela is a nurse in a large hospital, which causes her working shifts to constantly change.
To make it worse, she has deep sleep, and a big difficulty to wake up using alarm clocks.

Recently she got a digital clock as a gift, with several different options of alarm sounds,
and she hopes that it might help solve her problem.
But lately, she's been very tired and wants to enjoy every single moment of rest.
So she carries her new clock to every place she goes, and whenever she has some spare time, she tries to sleep,
setting her alarm clock to the time when she needs to wake up.
But, with so much anxiety to sleep, she ends up with some difficulty to fall asleep and enjoy some rest.

A problem that has been tormenting her is to know how many minutes of sleep she would have if she felt asleep immediately and woken up when the alarm clock ringed.
But she is not very good with numbers, and asked you for help to write a program that, given the current time and the alarm time, find out the number of minutes she could sleep.

Input
The input contains several test cases.
Each test case is described in one line,
containing four integers H1, M1, H2 and M2, with H1 : M1 representing the current hour and minute,
and H2:M2 representing the time (hour and minute) when the alarm clock is set to ring (0≤H1≤23, 0≤M1≤59, 0≤H2≤23, 0≤M2 ≤59).

The end of the input is indicated by a line containing only four zeros, separated by blank spaces.

Output
For each test case, your program must print one line, containing a single integer, indicating the number of minutes Daniela has to sleep.

Input Sample	Output Sample
1 5 3 5
23 59 0 34
21 33 21 10
0 0 0 0

120
35
1417
*/

import 'dart:io';

void alarmClock() {
  List<int> breaks = [];
  while (true) {
    final List<List<int>> points = input();
    if (points.first.first == 0 &&
        points.first.last == 0 &&
        points.last.first == 0 &&
        points.last.last == 0) {
      break;
    }

    final breakTime = calcBreak(points);
    breaks.add(breakTime);
  }
  outPut(breaks);
}

List<List<int>> input() {
  final String input = stdin.readLineSync()!;
  final List<String> stringPoints = input.split(" ");
  final List<int> start = [
    int.parse(stringPoints[0]),
    int.parse(stringPoints[1]),
  ];
  final List<int> end = [
    int.parse(stringPoints[2]),
    int.parse(stringPoints[3]),
  ];
  final List<List<int>> points = [start, end];
  return points;
}

int calcBreak(List<List<int>> points) {
  final start = points.first;
  final end = points.last;

  final breakTime =
      (end.first * 60 + end.last) - (start.first * 60 + start.last);

  if (breakTime < 0) {
    return 1440 + breakTime;
  } else {
    return breakTime;
  }
}

void outPut(List<int> breaks) {
  for (int oneBreak in breaks) {
    print(oneBreak);
  }
}
