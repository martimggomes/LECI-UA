import java.io.IOException;
import java.io.File;
import java.io.PrintWriter;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.stringtemplate.v4.*;

public class bml26Main {
    public static void main(String[] args) {
        try {
            if (args.length == 0) {
                System.err.println("Erro: Nenhum ficheiro de entrada fornecido.");
                System.err.println("Uso: java bml26Main <ficheiro.bml>");
                System.exit(1);
            }

            // ANÁLISE SINTÁTICA (PARSER)
            CharStream input = CharStreams.fromFileName(args[0]);
            bml26Lexer lexer = new bml26Lexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            bml26Parser parser = new bml26Parser(tokens);
            ParseTree tree = parser.program();

            if (parser.getNumberOfSyntaxErrors() == 0) {
                // ANÁLISE SEMÂNTICA
                SemanticVisitor semantic = new SemanticVisitor();
                semantic.visit(tree);

                if (!semantic.hasErrors()) {
                    // GERAÇÃO DE CÓDIGO
                    CompilerVisitor compiler = new CompilerVisitor(semantic.getSymbolTable());
                    ST code = compiler.visit(tree);
                    
                    if (code != null) {
                        // Extrair o nome do ficheiro (ex: min-01.bml -> min-01.cpp)
                        File inputFile = new File(args[0]);
                        String outputFileName = inputFile.getName().replace(".bml", ".cpp");
                        
                        // Escrever o código gerado para o novo ficheiro
                        try (PrintWriter out = new PrintWriter(outputFileName)) {
                            out.println(code.render());
                            System.out.println("Tradução concluída com sucesso!");
                            System.out.println("Ficheiro C++ gerado: " + outputFileName);
                        } catch (IOException e) {
                            System.err.println("Erro ao escrever o ficheiro C++: " + e.getMessage());
                        }
                    }
                } else {
                    System.err.println("Falha na compilação: Erros semânticos encontrados.");
                }
            }
        } catch (IOException e) {
            System.err.println("Erro de leitura: " + e.getMessage());
        }
    }
}