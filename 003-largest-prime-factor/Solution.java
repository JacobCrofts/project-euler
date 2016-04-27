class Solution {

  public static void main(String[] args) {
    long number = 600851475143L;
    int largestPrimeFactor = 0;
    for (int counter = 2; counter < (long) Math.sqrt(number); counter++) {
      if (number % counter == 0 && isPrime(counter)) {
        largestPrimeFactor = counter;
      }
    }
    System.out.println(largestPrimeFactor);
  }

  private static boolean isPrime(int number) {
    for (int counter = 2; counter <= (int) Math.sqrt(number); counter++) {
      if (number % counter == 0) {
        return false;
      }
    }
    return true;
  }

}