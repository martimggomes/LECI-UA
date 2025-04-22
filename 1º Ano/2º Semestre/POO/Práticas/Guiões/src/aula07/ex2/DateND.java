package aula07.ex2;

public class DateND extends Date {
    private int daysSince2000;

    public DateND(int daysSince2000) {
        super();
        this.daysSince2000 = daysSince2000;
    }

    @Override
    public int getYear() {
        int year = 2000;
        int days = daysSince2000;
        while (days > 365) {
            if (leapYear(year)) {
                if (days >= 366) {
                    days -= 366;
                    year++;
                } else {
                    break;
                }
            } else {
                days -= 365;
                year++;
            }
        }
        return year;
    }

    @Override
    public int getMonth() {
        int year = 2000;
        int days = daysSince2000;
        while (days > 365) {
            if (leapYear(year)) {
                if (days >= 366) {
                    days -= 366;
                    year++;
                } else {
                    break;
                }
            } else {
                days -= 365;
                year++;
            }
        }
        int month = 1;
        while (days > monthDays(month, year)) {
            days -= monthDays(month, year);
            month++;
        }
        return month;
    }

    @Override
    public int getDay() {
        int year = 2000;
        int days = daysSince2000;
        while (days > 365) {
            if (leapYear(year)) {
                if (days >= 366) {
                    days -= 366;
                    year++;
                } else {
                    break;
                }
            } else {
                days -= 365;
                year++;
            }
        }
        int month = 1;
        while (days > monthDays(month, year)) {
            days -= monthDays(month, year);
            month++;
        }
        return days;
    }

    @Override
    public void set(int day, int month, int year) {
        if (!valid(day, month, year)) {
            throw new IllegalArgumentException("Invalid date");
        }
        int days = 0;
        for (int i = 2000; i < year; i++) {
            days += leapYear(i) ? 366 : 365;
        }
        for (int i = 1; i < month; i++) {
            days += monthDays(i, year);
        }
        days += day - 1;
        this.daysSince2000 = days;
    }

    @Override
    public void increment() {
        daysSince2000++;
    }

    @Override
    public void decrement() {
        daysSince2000--;
    }

    @Override
    public String toString() {
        int year = getYear();
        int month = getMonth();
        int day = getDay();
        return String.format("%04d-%02d-%02d", year, month, day);
    }
}
