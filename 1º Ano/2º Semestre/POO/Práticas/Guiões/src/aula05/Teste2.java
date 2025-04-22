package aula05;

import java.util.Scanner;

public class Teste2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Calendar calendar = null;

        int choice;

        do {
            System.out.println("Calendar operations: ");
            System.out.println("1 - create new calendar");
            System.out.println("2 - print calendar month");
            System.out.println("3 - print calendar");
            System.out.println("0 - exit");

            choice = sc.nextInt();
            switch (choice) {
                case 1:
                    System.out.println("Enter year: ");
                    int year = sc.nextInt();
                    System.out.println("Enter first weekday of the year (1-Sunday to 7-Saturday):");
                    int firstWeekday = sc.nextInt();
                    calendar = new Calendar(year, firstWeekday);
                    System.out.println("Calendar created for year " + year);
                    break;

                case 2:
                    if (calendar == null) {
                        System.out.println("Create a calendar first, please");
                        break;
                    }
                    System.out.println("Enter a month (1-12): ");
                    int month = sc.nextInt();
                    System.out.println(calendar.printMonth(month));
                    break;

                case 3:
                    if (calendar == null) {
                        System.out.println("Create a calendar first, please");
                        break;
                    }
                    System.out.println(calendar);
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
