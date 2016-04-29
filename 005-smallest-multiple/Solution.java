class Solution {

  public static void main(String[] args) {
    int possibleMultiple = 2520;
    while (!isMultiple(possibleMultiple)) {
      possibleMultiple += 2520;
    }
    System.out.println(possibleMultiple);
  }

  private static boolean isMultiple(int number) {
    for (int divisor = 11; divisor <= 20; divisor++) {
      if (number % divisor != 0) {
        return false;
      }
    }
    return true;
  }

}