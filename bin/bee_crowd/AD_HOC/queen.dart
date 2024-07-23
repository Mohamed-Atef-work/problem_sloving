/*
Input
  The input contains several test cases.
The only line of each test case contains four integers X1, Y1, X2 and Y2 (1 ≤ X1, Y1, X2, Y2 ≤ 8).
The queen starts in the square with coordinates (X1, Y1), and must finish at the square with coordinates (X2, Y2).
In the chessboard, columns are numbered from 1 to 8, from left ro right; lines are also numbered from 1 to 8,
from top to bottom. The coordinates of a square in line X and column Y are (X, Y).

The end of input is indicated by a line containing four zeros, separated by spaces.

Output
  For each test case in the input your program must print a single line,containing an integer,
indicating the smallest number of moves needed for the queen to reach the new position.

Input Sample	Output Sample
4 4 6 2
3 5 3 5
5 5 4 3
0 0 0 0

1
0
2
*/
import 'dart:io';

void queen() {
  List<int> moves = [];
  while (true) {
    final List<List<int>> points = input();
    if (points.first.first == 0 &&
        points.first.last == 0 &&
        points.last.first == 0 &&
        points.last.last == 0) {
      break;
    }
    final int numberOfMoves = getMoves(points);
    moves.add(numberOfMoves);
  }
  outPut(moves);
}

void outPut(List<int> moves) {
  for (int move in moves) {
    print(move);
  }
}

List<List<int>> input() {
  final String input = stdin.readLineSync()!;
  final List<String> stringPoints = input.split(" ");
  final List<int> position = [
    int.parse(stringPoints[0]),
    int.parse(stringPoints[1]),
  ];
  final List<int> goal = [
    int.parse(stringPoints[2]),
    int.parse(stringPoints[3]),
  ];
  final List<List<int>> points = [position, goal];
  return points;
}

int getMoves(List<List<int>> points) {
  final List<int> position = points.first;
  final List<int> goal = points.last;

  if (position.first == goal.first && position.last == goal.last) {
    return 0;
  } else if (position.first == goal.first || position.last == goal.last) {
    return 1;
  } else if (sameDiameter(position, goal)) {
    return 1;
  } else {
    return 2;
  }
}

bool sameDiameter(List<int> position, List<int> goal) {
  final one = topRight(position, goal);
  final two = topLeft(position, goal);
  final three = bottomRight(position, goal);
  final four = bottomLeft(position, goal);

  if (one) {
    return one;
  } else if (two) {
    return two;
  } else if (three) {
    return three;
  } else {
    return four;
  }
}

bool topRight(List<int> position, List<int> goal) {
  int positionRow = position.first;
  int positionColumn = position.last;

  for (int range = 0; range < 8; range++) {
    positionRow--;
    positionColumn++;
    if (positionRow == goal.first && positionColumn == goal.last) {
      return true;
    }
    if (positionRow == 1 || positionColumn == 8) {
      return false;
    }
  }
  return false;
}

bool topLeft(List<int> position, List<int> goal) {
  int positionRow = position.first;
  int positionColumn = position.last;
  for (int range = 0; range < 8; range++) {
    positionRow--;
    positionColumn--;
    if (positionRow == goal.first && positionColumn == goal.last) {
      return true;
    }
    if (positionRow == 1 || positionColumn == 1) {
      return false;
    }
  }
  return false;
}

bool bottomRight(List<int> position, List<int> goal) {
  int positionRow = position.first;
  int positionColumn = position.last;

  for (int range = 0; range < 8; range++) {
    positionRow++;
    positionColumn++;
    if (positionRow == goal.first && positionColumn == goal.last) {
      return true;
    }
    if (positionRow == 8 || positionColumn == 8) {
      return false;
    }
  }
  return false;
}

bool bottomLeft(List<int> position, List<int> goal) {
  int positionRow = position.first;
  int positionColumn = position.last;

  for (int range = 0; range < 8; range++) {
    positionRow++;
    positionColumn--;
    if (positionRow == goal.first && positionColumn == goal.last) {
      return true;
    }
    if (positionRow == 8 || positionColumn == 1) {
      return false;
    }
  }
  return false;
}
