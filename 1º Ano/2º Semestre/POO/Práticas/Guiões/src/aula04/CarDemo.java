package aula04;

import java.util.Scanner;


class Car {
    public String make;
    public String model;
    public int year;
    public int kms;

    public Car(String make, String model, int year, int kms) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.kms = kms;
    }

    public void drive(int distance) {
        this.kms += distance;
    }

}

public class CarDemo {

    static Scanner sc = new Scanner(System.in);

    static int registerCars(Car[] cars) {
        int numCars = 0;
        while (numCars < cars.length) {
            System.out.print("Insira dados do carro (marca modelo ano quilómetros): ");
            String input = sc.nextLine().trim();

            if (input.isEmpty())
                break;
            
            String[] tokens = input.split(" ");
            if (tokens.length != 4) {
                System.out.println("Má formatação dos dados. Digite novamente.");
                continue;
            }

            String make = tokens[0];
            String model = tokens[1];
            int year;
            int kms;

            try {
                year = Integer.parseInt(tokens[2]);
                kms = Integer.parseInt(tokens[3]);
            } catch (NumberFormatException e) {
                System.out.println("Má formatação. Digite novamente.");
                continue;
            }

            if (!isValidMake(make) || !isValidYear(year) || !isValidKms(kms)) {
                System.out.println("Má formatação. Digite novamente.");
                continue;
            }
            
            cars[numCars] = new Car(make, model, year, kms);
            numCars++;

        }
        return numCars;
   }

    static void registerTrips(Car[] cars, int numCars) {

        System.out.print("Registe uma viagem no formato \"carro:distância\": ");
        String input = sc.nextLine().trim();

        while (!input.isEmpty()) {
            String[] tripData = input.split(":");
            if (tripData.length != 2) {
                System.out.println("Má formatação. Digite novamente.");
                input = sc.nextLine().trim();
                continue;
            }

            int carIndex;
            int distance;

            try {
                carIndex = Integer.parseInt(tripData[0]);
                distance = Integer.parseInt(tripData[1]);
            } catch (NumberFormatException e) {
                System.out.println("Má formatação. Digite novamente.");
                input = sc.nextLine().trim();
                continue;
            }

            if (carIndex < 0 || carIndex >= numCars) {
                System.out.println("Má formatação. Digite novamente.");
                input = sc.nextLine().trim();
                continue;
            }

            cars[carIndex].drive(distance);
            System.out.println("Registe uma viagem no formato \"carro:distância\": ");
            input = sc.nextLine().trim();
        }
    }

    static void listCars(Car[] cars, int numCars) {
        System.out.println("\nCarros registados: ");
        for (int i = 0; i < numCars; i++) {
                Car car = cars[i];
            System.out.printf("%s %s, %d, kms: %d\n", car.make, car.model, car.year, car.kms);
        }
        
        System.out.println("\n");
    }


    static boolean isValidMake(String make) {
        return make.matches("\\w+");
    }

    static boolean isValidYear(int year) {
        return String.valueOf(year).matches("\\d{4}");
    }

    static boolean isValidKms(int kms) {
        return kms >= 0;
    }

    public static void main(String[] args) {

        Car[] cars = new Car[10];

        int numCars = registerCars(cars);

        if (numCars > 0) {
            listCars(cars, numCars);
            registerTrips(cars, numCars);
            listCars(cars, numCars);
        }

        sc.close();

    }
}


