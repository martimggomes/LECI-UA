package exstreino;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        PublicationManager publicationManager = new PublicationManager();
        Scanner scanner = new Scanner(System.in);

        boolean running = true;
        while (running) {
            System.out.println("\nMenu:");
            System.out.println("1. Adicionar nova publicação");
            System.out.println("2. Listar publicações");
            System.out.println("3. Sair");
            System.out.print("Escolha uma opção: ");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer do scanner

            switch (choice) {
                case 1:
                    addPublicationMenu(publicationManager, scanner);
                    break;
                case 2:
                    publicationManager.listPublications();
                    break;
                case 3:
                    running = false;
                    break;
                default:
                    System.out.println("Opção inválida. Por favor, escolha uma opção válida.");
            }
        }

        scanner.close();
    }

    private static void addPublicationMenu(PublicationManager publicationManager, Scanner scanner) {
        System.out.println("\nEscolha o tipo de publicação:");
        System.out.println("1. Artigo de Inovação");
        System.out.println("2. Artigo de Revisão");
        System.out.println("3. Artigo de Conferência");
        System.out.print("Escolha uma opção: ");

        int choice = scanner.nextInt();
        scanner.nextLine(); // Limpar o buffer do scanner

        System.out.print("Título: ");
        String title = scanner.nextLine();
        System.out.print("Autor: ");
        String author = scanner.nextLine();
        System.out.print("Instituição do autor: ");
        String affiliation = scanner.nextLine();
        System.out.print("Data de submissão (dd/MM/yyyy): ");
        Date submissionDate = null;
        try {
            submissionDate = new SimpleDateFormat("dd/MM/yyyy").parse(scanner.nextLine());
        } catch (ParseException e) {
            System.out.println("Formato de data inválido. Use o formato dd/MM/yyyy.");
            return;
        }
        System.out.print("Título da revista ou conferência: ");
        String publicationTitle = scanner.nextLine();

        switch (choice) {
            case 1:
                System.out.print("Número do volume: ");
                int volumeNumber = scanner.nextInt();
                publicationManager.addPublication(new Article(title, author, affiliation, submissionDate, publicationTitle, volumeNumber));
                break;
            case 2:
                System.out.print("Tópico da revisão: ");
                String reviewTopic = scanner.nextLine();
                System.out.print("Número do volume: ");
                volumeNumber = scanner.nextInt();
                publicationManager.addPublication(new Review(title, author, affiliation, submissionDate, publicationTitle, reviewTopic, volumeNumber));
                break;
            case 3:
                System.out.print("Local da conferência: ");
                String conferenceLocation = scanner.nextLine();
                publicationManager.addPublication(new ConferencePaper(title, author, affiliation, submissionDate, publicationTitle, conferenceLocation));
                break;
            default:
                System.out.println("Opção inválida.");
        }
    }
}
