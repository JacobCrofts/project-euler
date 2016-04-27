class Solution {

  public static void main(String[] args) {
    int sum = 2;
    Integer[] fibNums = {1, 2};
    while (fibNums[1] < 4000000) {
      Integer nextNum = fibNums[0] + fibNums[1];
      if (nextNum % 2 == 0) {
        sum += nextNum;
      }
      fibNums[0] = fibNums[1];
      fibNums[1] = nextNum;
    }
    System.out.println(sum);
  }

}