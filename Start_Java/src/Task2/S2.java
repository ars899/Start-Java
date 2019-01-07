package Task2;

public class S2 {
    public static void main(String[] args) {

        System.out.println("Даны три числа: 2, 4, 6.");
        int a = 2;
        int b = 4;
        int c = 6;
        int sum = 0;
        if ((a > b) && (b > c)) {
            sum = a + b;
            System.out.println("Сумма двух наибольших: " + sum);
        } else if ((a > b) && (b < c)) {
            sum = a + c;
            System.out.println("Сумма двух наибольших: " + sum);
        } else if ((a < b) && (c > a)) {
            sum = c + b;
            System.out.println("Сумма двух наибольших: " + sum);
        }
    }
}

