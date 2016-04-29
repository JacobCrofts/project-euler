class Solution {

  public static void main(String[] args) {
    System.out.println(nthPrime(10001));
  }

  private static int nthPrime(int n) {
    int numberOfPrimes = 0;
    int numberToCheck = 0;
    while (numberOfPrimes < n) {
      numberToCheck++;
      if (isPrime(numberToCheck)) {
        numberOfPrimes++;
      }
    }
    return numberToCheck;
  }

  private static boolean isPrime(int number) {
    if (number < 2) {
      return false;
    }
    for (int possibleDivisor = 2; possibleDivisor <= (int) Math.sqrt(number); possibleDivisor++) {
      if (number % possibleDivisor == 0) {
        return false;
      }
    }
    return true;
  }

}