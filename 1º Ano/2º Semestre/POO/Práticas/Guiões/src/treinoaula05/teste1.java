package treinoaula05;

import java.util.Scanner;

public class teste1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        DateYMD currentDate = new DateYMD(1,1,2024);

        int choice;

        do {
            System.out.println("Date operations: ");
            System.out.println("1 - create new date");
            System.out.println("2 - show current date");
            System.out.println("3 - increment date");
            System.out.println("4 - decrement date");
            System.out.println("0 - exit");

            choice = sc.nextInt();
            switch (choice) {

                case 1:
                    System.out.println("Enter day, month, year: ");
                    int day = sc.nextInt();
                    int month = sc.nextInt();
                    int year = sc.nextInt();
                    try {
                        currentDate.set(day, month, year);
                        System.out.println("Date set successfully!");
                    } catch (IllegalArgumentException e) {
                        System.out.println("Invalid date");
                    }
                    break;

                case 2:
                System.out.println("Current Date: " + currentDate);
                break;

                case 3:
                currentDate.increment();
                System.out.println("Incremented date: " + currentDate);
                break;

                case 4:
                currentDate.decrement();
                System.out.println("Decremented date: " + currentDate);
                break;

                case 0:
                break;
                
                default:
                System.out.println("Invalid choice! Try another option!");
                
            }

        } while (choice != 0);

        sc.close();

    }
}
