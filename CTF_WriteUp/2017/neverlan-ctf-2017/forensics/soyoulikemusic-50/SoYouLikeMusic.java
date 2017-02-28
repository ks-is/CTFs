/*
 * Decompiled with CFR 0_118.
 */
import java.io.InputStream;
import java.io.PrintStream;
import java.util.Scanner;

public class SoYouLikeMusic {
    private static Scanner scan;

    public static void main(String[] arrstring) {
        scan = new Scanner(System.in);
        System.out.println("Ahh welcome... so I hear you like music? What might I call you fellow listener?");
        String string = scan.nextLine().trim();
        System.out.println();
        System.out.println("Well " + string + ", let's play a game and see how much you like music.");
        SoYouLikeMusic.playGame();
    }

    public static void decompilingTheCodeNow() {
    }

    private static boolean qOne() {
        boolean bl = false;
        System.out.println("Who was the special artist to dj music for our live streams before the event started?");
        while (!bl) {
            String string = scan.nextLine().trim();
            if (string.equals("s7a73farm")) {
                bl = true;
                continue;
            }
            System.out.println("Try Again...");
        }
        return bl;
    }

    private static boolean qTwo() {
        boolean bl = false;
        System.out.println("Now you are on a roll! What is zestyfe's favorite type of music?");
        while (!bl) {
            String string = scan.nextLine().trim();
            if (string.equalsIgnoreCase("dubstep")) {
                bl = true;
                continue;
            }
            System.out.println("Try Again...");
        }
        return bl;
    }

    private static boolean qThree() {
        boolean bl = false;
        System.out.println("Final Question! What is the name of purvesta's only rap song?");
        while (!bl) {
            String string = scan.nextLine().trim();
            if (string.equals("The_Gettysburg_Address_Rap")) {
                bl = true;
                continue;
            }
            System.out.println("Try Again...");
        }
        return bl;
    }

    private static void playGame() {
        System.out.println("I will ask you three questions. If you can answer them all right, then I will point you towards your precious flag you seek!");
        System.out.println("Want to play? (y/n)");
        String string = scan.nextLine().trim();
        System.out.println();
        System.out.println("Great let's play! (ctrl-c if you really don't want to play)");
        System.out.println();
        if (SoYouLikeMusic.qOne()) {
            System.out.println();
            if (SoYouLikeMusic.qTwo()) {
                System.out.println();
                if (SoYouLikeMusic.qThree()) {
                    System.out.println();
                    System.out.println("Congratulations!! You did it!!");
                    System.out.println("ZmxhZ3tTdGlsbF9XYWl0aW5nX09uX3B1cnZlc3RhJ3NfTWl4dGFwZX0=");
                    System.exit(0);
                }
            }
        }
    }
}