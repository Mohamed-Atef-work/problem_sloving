/*
Write an algorithm that reads two floating values (x and y), which should represent the coordinates of a point in a plane.
 Next, determine which quadrant the point belongs, or if you are at one of the Cartesian axes or the origin (x = y = 0).


If the point is at the origin, write the message "Origem".

If the point is at X axis write "Eixo X", else if the point is at Y axis write "Eixo Y".

Input
The input contains the coordinates of a point.

Output
The output should display the quadrant in which the point is.*/
import 'dart:io';

coordinates() {
  final String? input = stdin.readLineSync();

  final inputXY = input!.split(" ");

  final double x = double.parse(inputXY[0]);
  final double y = double.parse(inputXY[1]);

  if (x == 0 && y == 0) {
    print("Origem");
  } else if (x == 0) {
    print("Eixo Y");
  } else if (y == 0) {
    print("Eixo X");
  } else if (x > 0 && y > 0) {
    print("Q1");
  } else if (x < 0 && y < 0) {
    print("Q3");
  } else if (x < 0 && y > 0) {
    print("Q2");
  } else if (x > 0 && y < 0) {
    print("Q4");
  } else {
    print("Invalid!");
  }
}
