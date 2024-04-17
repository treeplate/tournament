import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  List<String> things = List.generate(26, userGenerate)..shuffle();
  Random r = Random();
  while (things.length > 1) {
    String a = things[r.nextInt(things.length)];
    String b = things[r.nextInt(things.length)];
    if(a == b) continue;
    if (userCompare(a, b)) {
      things.remove(b);
    } else {
      things.remove(a);
    }
  }
  print("Winner: ${things.single}");
}

String numberGenerate(int index) => (index + 2).toString();
String userGenerate(int index) => stdin.readLineSync()!;

bool isPrime(int n) {
  int factorCount = 0;
  int i = 2;
  while (i <= sqrt(n)) {
    if (n % i == 0) factorCount++;
    i++;
  }
  return factorCount == 0;
}

bool numberCompare(String a, String b) {
  int aInt = int.parse(a);
  int bInt = int.parse(b);
  return aInt < bInt;
}

bool userCompare(String a, String b) {
  print("Is $a better than $b?");
  print("Y for yes, N for no");
  String result = "";
  while (result.toUpperCase() != 'Y' && result.toUpperCase() != 'N') {
    result = stdin.readLineSync()!;
  }
  return result.toUpperCase() == 'Y';
}
