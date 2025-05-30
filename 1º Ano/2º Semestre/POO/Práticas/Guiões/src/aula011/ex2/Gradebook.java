package aula011.ex2;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.LinkedList;

public class Gradebook {
    private LinkedList<Student> students = new LinkedList<>();
    private IGradeCalculator gradeCalculator= new SimpleGradeCalculator();
    
    public void load(String filename) {
        LinkedList<String> lines = new LinkedList<>();
        Path path = Paths.get(filename);

        try {
            lines = new LinkedList<>(Files.readAllLines(path));
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());    
            System.exit(1);
        }

        for (String line: lines) {
            String[] parts = line.split("\\|");
            String name = parts[0];
            LinkedList<Double> grades = new LinkedList<>(Arrays.stream(parts).toList().subList(1, parts.length).stream().map(Double::parseDouble).toList());
            students.add(new Student(name, grades));

        }
    }

    public void addStudent(Student student) {
        students.add(student);
    }

    public void removeStudent(String name) {
        students.removeIf(student -> student.getName().equals(name));
    }

    public Student getStudent(String name) {
        return students.stream().filter(student -> student.getName().equals(name)).findFirst().orElse(null);
    }

    public double calculateAverageGrade(String name) {
        return gradeCalculator.calculate((LinkedList<Double>) getStudent(name).getGrades());
    }

    public void printAllStudents() {
        for (Student student : students)
            System.out.printf("Nome: %s%nNota Final: %.2f%n%n", student.getName(), gradeCalculator.calculate((LinkedList<Double>) student.getGrades()));
    }
}
