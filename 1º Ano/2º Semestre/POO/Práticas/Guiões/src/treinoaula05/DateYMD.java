package treinoaula05;

public class DateYMD {
    private int year;
    private int month;
    private int day;

    public DateYMD(int day, int month, int year) {
        this.year = year;
        this.month = month;
        this.day = day;
    }

    public void set(int day, int month, int year) {
        if (!valid(day, month, year)) {
            throw new IllegalArgumentException("Invalid date");
        }
        this.day = day;
        this.month = month;
        this.year = year;
    }

    public int getYear() {
        return year;
    }

    public int getMonth() {
        return month;
    }

    public int getDay() {
        return day;
    }
    
    public static Boolean validMonth(int month) {
        return month >= 1 && month <= 12;
    }

    public static int monthDays(int month, int year) {
        if (validMonth(month)) {
            if (month == 2) {
                return leapYear(year) ? 29 : 28;
            } else if (month == 4 || month == 6 || month == 8 || month == 9 || month == 11) {
                return 30;
            } else {
                return 31;
            }
        }
        return 0; // Default return statement
    }

    public static Boolean leapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }


    public static Boolean valid(int day, int month, int year) {
        if (validMonth(month)) {
            if (day >= 1 && day <= monthDays(month, year)) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

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
        return String.format("%02d/%02d/%04d", day, month, year);
    }


}