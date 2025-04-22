package aula09.ex3;

import java.util.Scanner;

public class PlaneTester {
    public static void main(String[] args) {
        PlaneManager planeManager = new PlaneManager();
        Scanner scanner = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\nMenu:");
            System.out.println("1. Adicionar aviões à frota");
            System.out.println("2. Remover aviões da frota");
            System.out.println("3. Procurar um avião em específico");
            System.out.println("4. Imprimir a informação de todos os aviões na frota");
            System.out.println("5. Imprimir a lista de todos os aviões comerciais na frota");
            System.out.println("6. Imprimir a lista de todos os aviões militares na frota");
            System.out.println("7. Imprimir o avião mais rápido na frota");
            System.out.println("0. Sair do programa");

            System.out.print("Escolha: ");
            choice = Integer.parseInt(scanner.nextLine());

            switch (choice) {
                case 1 -> addPlane(planeManager, scanner);
                case 2 -> removePlane(planeManager, scanner);
                case 3 -> searchPlane(planeManager, scanner);
                case 4 -> printAllPlanes(planeManager);
                case 5 -> printCommercialPlanes(planeManager);
                case 6 -> printMilitaryPlanes(planeManager);
                case 7 -> printFastestPlane(planeManager);
                case 0 -> System.out.println("Saindo do programa...");
                default -> System.out.println("Escolha inválida. Tente novamente");
            }
        } while (choice != 0);

        scanner.close();
    }

    private static void addPlane(PlaneManager planeManager, Scanner scanner) {
        System.out.print("Digite o ID dd avião: ");
        String id = scanner.nextLine();
        System.out.print("Digite o fabricante do avião: ");
        String fabricante = scanner.nextLine();
        System.out.print("Digite o modelo do avião: ");
        String modelo = scanner.nextLine();
        System.out.print("Digite o ano de produção do avião: ");
        int anoProducao = Integer.parseInt(scanner.nextLine());
        System.out.print("Digite a quantidade de passageiros do avião: ");
        int numPassageiros = Integer.parseInt(scanner.nextLine());
        System.out.print("Digite a velocidade máxima do avião: ");
        int velocidadeMaxima = Integer.parseInt(scanner.nextLine());
        System.out.print("Digite o tipo do avião (comercial/militar): ");
        String tipo = scanner.nextLine();
        if (tipo.equals("comercial")) {
            System.out.print("Digite a quantidade de tripulantes do avião: ");
            int numTripulantes = Integer.parseInt(scanner.nextLine());
            planeManager.addPlane(new CommercialPlane(id, fabricante, modelo, anoProducao, numPassageiros, velocidadeMaxima, numTripulantes));
        } else if (tipo.equals("militar")) {
            System.out.print("Enter the plane's missile count: ");
            int numMunicoes = Integer.parseInt(scanner.nextLine());
            planeManager.addPlane(new MilitaryPlane(id, fabricante, modelo, anoProducao, numPassageiros, velocidadeMaxima, numMunicoes)); }
    }

    private static void removePlane(PlaneManager planeManager, Scanner scanner) {
        System.out.print("Digite o ID do avião:");
        String id = scanner.nextLine();
        if (planeManager.searchPlane(id) == null) {
            System.out.println("Avião não encontrado.");
            return;
        }
        planeManager.removePlane(id);
    }

    private static void searchPlane(PlaneManager planeManager, Scanner scanner) {
        System.out.print("Digite o ID do avião:");
        String id = scanner.nextLine();
        Plane plane = planeManager.searchPlane(id);
        if (plane == null) {
            System.out.println("Avião não encontrado.");
            return;
        }
        System.out.println(plane);
    }

    private static void printAllPlanes(PlaneManager planeManager) {
        planeManager.printAllPlanes();
    }

    private static void printCommercialPlanes(PlaneManager planeManager) {
        planeManager.printAllPlanes("comercial");
    }

    private static void printMilitaryPlanes(PlaneManager planeManager) {
        planeManager.printAllPlanes("militar");
    }

    private static void printFastestPlane(PlaneManager planeManager) {
        System.out.print(planeManager.getFastestPlane());
    }
}
