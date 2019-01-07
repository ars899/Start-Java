package Task8;

public class S8 {
    public static void main(String args[]) {
        int i = 662; // Целые
        int sum = 0;
        while (i > 0) {
            sum += i % 10;
            i /= 10;
        }

        System.out.println("Сумма всех цифр числа: " + sum);
    }
}