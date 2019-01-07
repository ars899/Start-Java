package Task7;

public class S7 {
    public static void main(String[] args) {
        int a = 1;
        int b = 5;
        for (int i = a, count = 1; i <= b; i++, count++) {
            for (int j = 0; j < count; j++) System.out.print(i);
            // System.out.println(); // - Enter между числами
        }
    }
}
