package aula011.ex2;

import java.util.LinkedList;

public class SimpleGradeCalculator implements IGradeCalculator {
    @Override
    public double calculate(LinkedList<Double> grades) {
            double sum = 0;
            for (double grade: grades) 
                sum += grade;
            return sum / grades.size();
    }
}