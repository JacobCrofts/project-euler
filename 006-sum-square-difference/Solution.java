class Solution {

  public static void main(String[] args) {
    int difference = sumOfSquares(1, 100) - squareOfSums(1, 100);
    System.out.println((difference < 0) ? difference * -1 : difference);
  }

  private static int sumOfSquares(int start, int end) {
    int sum = 0;
    while (start <= end) {
      sum += (start * start);
      start++;
    }
    return sum;
  }

  private static int squareOfSums(int start, int end) {
    int sum = 0;
    while (start <= end) {
      sum += start;
      start++;
    }
    return (sum * sum);
  }

}