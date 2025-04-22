package aula09.ex1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;
import aula07.ex2.Date;
import aula07.ex2.DateYMD;

public class ALDemo {
    public static void main(String[] args) {
        ArrayList<Integer> c1 = new ArrayList<>();
        for (int i = 10; i <= 100; i += 10)
            c1.add(i);
        System.out.println("Size: " + c1.size());
        for (int i = 0; i < c1.size(); i++)
            System.out.println("Elemento: " + c1.get(i));

        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        c2.add(3, "Neve");
        System.out.println(c2);
        System.out.println(c2.indexOf("Frio"));
        Collections.sort(c2);
        System.out.println(c2);
        c2.remove("Frio");
        c2.remove(0);
        System.out.println(c2);
        System.out.println(c2.contains("Ar"));
        System.out.println(c2.lastIndexOf("Chuva"));

        String[] str = {"Martim", "Guiherme", "Leonardo", "Rodrigo", "Bernardo", "Martim"};

        Set<String> c3 = new HashSet<>();
        for (String i : str) {
            if (!c3.add(i))
                System.out.println("Nome duplicado: " + i);
        }
        System.out.println(c3.size() + " nomes distintos");

        for (String s : c3)
            System.out.println(s);

        Set<Date> c4 = new TreeSet<>();
        c4.add(new DateYMD(20, 1, 2034));
        c4.add(new DateYMD(1, 1, 2123));
        c4.add(new DateYMD(1, 1, 2045));
        c4.add(new DateYMD(1, 1, 2021));
        c4.add(new DateYMD(1, 1, 2020));
        System.out.println(c4);

        for (Date d : c4)
            System.out.println(d);

    }
}
