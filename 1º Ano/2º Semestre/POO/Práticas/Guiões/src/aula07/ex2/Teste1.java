package aula07.ex2;

import java.util.Scanner;

public class Teste1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Date currentDate; // Mudança aqui para permitir objetos DateYMD e DateND

        // Aqui é onde você decide qual tipo de data usar
        System.out.println("Choose date representation:");
        System.out.println("1 - Year-Month-Day (YMD)");
        System.out.println("2 - Number of days since January 1, 2000 (ND)");
        int dateChoice = sc.nextInt();
        if (dateChoice == 1) {
            currentDate = new DateYMD(1, 1, 2024);
        } else if (dateChoice == 2) {
            System.out.println("Enter the number of days since January 1, 2000:");
            int daysSince2000 = sc.nextInt();
            currentDate = new DateND(daysSince2000);
        } else {
            System.out.println("Invalid choice! Exiting program.");
            sc.close();
            return;
        }

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


