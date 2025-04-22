package ex1;

public class Ex1 {

    public static void main(String[] args) {
        
        Empresa empresa = new Empresa("Empresa1", "1234-567", "abc@ua.pt");

        Motociclo motociclo1 = new Motociclo("12345", "Honda", "CBR", 125, "estrada");
        motociclo1.trajeto(20);
        Motociclo motociclo2 = new Motociclo("12346", "Honda", "CBR", 125, "estrada");
        motociclo2.trajeto(25);
        Motociclo motociclo3 = new Motociclo("12347", "Honda", "CBR", 125, "desportivo");
        motociclo3.trajeto(30);

        Automovelligeiro automovelLigeiro1 = new Automovelligeiro("12348", "Fiat", "Palio", 125, 12345, 5);
        automovelLigeiro1.trajeto(20);
        Automovelligeiro automovelLigeiro2 = new Automovelligeiro("12349", "Fiat", "Palio", 125, 12345, 5);
        automovelLigeiro2.trajeto(25);

        Taxi taxi1 = new Taxi("12350", "Fiat", "Palio", 125, 12345, 5, 123456789);
        taxi1.trajeto(20);
        Taxi taxi2 = new Taxi("12351", "Fiat", "Palio", 125, 12345, 5, 123456789);
        taxi2.trajeto(25);

        Pesadodemercadorias pesadoMercadorias1 = new Pesadodemercadorias("12352", "Fiat", "Palio", 125, 12345, 5, 150);
        pesadoMercadorias1.trajeto(20);
        Pesadodemercadorias pesadoMercadorias2 = new Pesadodemercadorias("12353", "Fiat", "Palio", 125, 12345, 5, 150);
        pesadoMercadorias2.trajeto(25);

        Pesadodepassageiros pesadoPassageiros1 = new Pesadodepassageiros("12354", "Fiat", "Palio", 125, 12345, 5, 30);
        pesadoPassageiros1.trajeto(20);
        Pesadodepassageiros pesadoPassageiros2 = new Pesadodepassageiros("12355", "Fiat", "Palio", 125, 12345, 5, 30);
        pesadoPassageiros2.trajeto(25);
        
        empresa.addVeiculos(motociclo1, motociclo2, motociclo3);
        empresa.addVeiculos(automovelLigeiro1, automovelLigeiro2);
        empresa.addVeiculos(taxi1, taxi2);
        empresa.addVeiculos(pesadoMercadorias1, pesadoMercadorias2);
        empresa.addVeiculos(pesadoPassageiros1, pesadoPassageiros2);

        System.out.println(empresa.toString());

        System.out.println("\n\n");

        for ( Veiculo veiculo : empresa.getVeiculos() ) {
            System.out.println(veiculo.toString());
        }

        System.out.println("\n\n");

        Veiculo veiculoComMaiorDistancia = null;
        for ( Veiculo veiculo : empresa.getVeiculos() ) {
            if (veiculoComMaiorDistancia == null) {
                veiculoComMaiorDistancia = veiculo;
            } else if (veiculo.distanciaTotal() > veiculoComMaiorDistancia.distanciaTotal()) {
                veiculoComMaiorDistancia = veiculo;
            }
        }

        System.out.println(veiculoComMaiorDistancia.toString());

        
    }
    
}