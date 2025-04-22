package aula07.ex2;

import java.util.Objects;

public class DateYMD extends Date {
        private int day;
        private int month;
        private int year;
    
        public DateYMD(int day, int month, int year) {
            super();
            if (!valid(day, month, year)) {
                throw new IllegalArgumentException("Invalid date");
            }
            this.day = day;
            this.month = month;
            this.year = year;
        }
    
        @Override
        public int getYear() {
            return year;
        }
    
        @Override
        public int getMonth() {
            return month;
        }
    
        @Override
        public int getDay() {
            return day;
        }
    
        @Override
        public void set(int day, int month, int year) {
            if (!valid(day, month, year)) {
                throw new IllegalArgumentException("Invalid date");
            }
            this.day = day;
            this.month = month;
            this.year = year;
        }
    
        @Override
        public void increment() {
            day++;
            if (day > monthDays(month, year)) {
                day = 1;
                month++;
                if (month > 12) {
                    month = 1;
                    year++;
                }
            }
        }
    
        @Override
        public void decrement() {
            day--;
            if (day < 1) {
                month--;
                if (month < 1) {
                    month = 12;
                    year--;
                }
                day = monthDays(month, year);
            }
        }
        
        @Override
        public String toString() {
        return String.format("%04d-%02d-%02d", year, month, day);
        }

        @Override
        public int hashCode() {
        return Objects.hash(day, month, year);
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            DateYMD dateYMD = (DateYMD) o;
            return day == dateYMD.day && month == dateYMD.month && year == dateYMD.year;
        }
        
        }
    
    
    

