import 'dart:io';

void longWords() {
  print("Pleas Enter The Number Of The Words....");
  final String? numString = stdin.readLineSync();
  final int num = int.parse(numString!);

  for (int i = 0; i < num; i++) {
    print("Pleas Enter The Word ${(i + 1)} ....");
    final String? word = stdin.readLineSync();

    List<String> letters = word!.split("");

    final int length = letters.length - 2;

    if (letters.length - 2 > 10) {
      final String output = letters.first + length.toString() + letters.last;
      print(output);
    } else {
      print("The Same !!!!");
    }
  }

  print("Done......");
}
