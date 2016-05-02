import java.util.Arrays;

class Solution {

  public static void main(String[] args) {
    for (int a = 1; a < 1000; a++) {
      for (int b = a; a + b < 1000; b++) {
        int c = 1000 - (a + b);
        int[] numbers = {a, b, c};
        if (isSpecialTriplet(numbers)) {
          System.out.println(a * b * c);
          return;
        }
      }
    }
  }

  private static boolean isSpecialTriplet(int[] numbers) {
    Arrays.sort(numbers);
    int a = numbers[0];
    int b = numbers[1];
    int c = numbers[2];
    return a * a + b * b == c * c && a + b + c == 1000;
  }

}