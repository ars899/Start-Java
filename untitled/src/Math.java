public class Math {
    public static void main(String[] args) {
        boolean a = 1 + 1 == 2;
        boolean b = 2 - 2 == 0;
        boolean c = 2 * 2 == 4;
        boolean d = 10 / 2 == 5;
        boolean e = 10 * 10 == 100; // я хотел использовать sqrt, но не полностью разобрался с ним
        boolean f = 5 % 10 == 5;

        if (a) {
            System.out.println("1+1=2");
        }
        if (b) {
            System.out.println("2-2=0");
        }
        if (c) {
            System.out.println("2*2=4");
        }
        if (d) {
            System.out.println("10/2=5");
        }
        if (e) {
            System.out.println("10*10=100");
        }
        if (f) {
            System.out.println("5%10=0.5");

        }
    }
}