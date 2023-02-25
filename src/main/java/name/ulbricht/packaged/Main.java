package name.ulbricht.packaged;

import java.util.Scanner;

public final class Main {

    public static void main(final String... args) {
        try (final var scanner = new Scanner(System.in)) {
            System.out.print("Enter your name: ");
            final var name = scanner.nextLine();

            System.out.println("Hello, " + name + "!");
        }
    }
}
