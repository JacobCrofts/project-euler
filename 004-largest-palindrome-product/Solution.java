class Solution {

  public static void main(String[] args) {
    int greatestPalindromeProduct = 0;
    for (int firstNumber = 100; firstNumber < 1000; firstNumber++) {
      for (int secondNumber = firstNumber; secondNumber < 1000; secondNumber++) {
        int sum = firstNumber * secondNumber;
        if (isPalindrome(sum) && sum > greatestPalindromeProduct) {
          greatestPalindromeProduct = sum;
        }
      }
    }
    System.out.println(greatestPalindromeProduct);
  }

  private static boolean isPalindrome(Integer number) {

    String numberString = number.toString();
    String reversedString = "";

    for (int counter = 0; counter < numberString.length(); counter++) {
      reversedString = numberString.charAt(counter) + reversedString;
    }

    return numberString.equals(reversedString);
  }

}