package aula07.ex2;

public abstract class Date {
        public abstract int getYear();
        public abstract int getMonth();
        public abstract int getDay();
        public abstract void set(int day, int month, int year);
        public abstract void increment();
        public abstract void decrement();
    
        public static boolean validMonth(int month) {
            return month >= 1 && month <= 12;
        }
    
        public static int monthDays(int month, int year) {
            if (month == 2) {
                return leapYear(year) ? 29 : 28;
            } else if (month == 4 || month == 6 || month == 9 || month == 11) {
                return 30;
            } else {
                return 31;
            }
        }
    
        public static boolean leapYear(int year) {
            return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
        }
    
        public static boolean valid(int day, int month, int year) {
            if (month < 1 || month > 12) return false;
            if (day < 1 || day > monthDays(month, year)) return false;
            return true;
        }
    }
    

