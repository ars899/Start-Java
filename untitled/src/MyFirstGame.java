public class MyFirstGame {
    public static void main(String[] args) {
        int ai = 77;
        System.out.println("угадай число: компьютер загадывает целое число от 0 до 100, которое вам необходимо угадать");
        System.out.println("Введите число:");

        for (int my = 1; my < ai; my++) {
            if (my == ai) {
                System.out.println("Ура, вы выиграли!");
            } else if (my < ai) {
                System.out.println("Введенное вами число больше того, что загадал компьютер");
            } else {

                System.out.println("Введенное вами число меньше того, что загадал компьютер");

            }
        }
    }
}