package treinoaula05;

public class Calendar {
    int[][] events;
    int year;
    int firstWeekdayOfYear;

    public Calendar(int year, int firstWeekdayofYear) {
        this.year = year;
        this.firstWeekdayOfYear = firstWeekdayofYear;
        events = new int[13][0];

        for(int i = 1; i <= 12; i++) {
            events[i] = new int[DateYMD.monthDays(i, year) + 1];
        }
    
    }

    public int getYear() {
        return year;
    }

    public int getFirstWeekdayOfYear() {
        return firstWeekdayOfYear;
    }

    public int getFirstWeekdayOfYear(int month) {
        int m = month;
        int y = year;
        if (m < 3) {
            m += 12;
            y--;
        }
        int k = y % 100;
        int j = y / 100;
        int h = (1 + (26 * (m + 1)) / 10 + k + k / 4 + j / 4 + 5 * j) % 7;
        return ((h + 5) % 7) + 1;
    }

    public void addEvent(DateYMD date) {
        if (date.getYear() == year) {
            events[date.getMonth()][date.getDay()]++;
        }
    }
    
    public void removeEvent(DateYMD date) {
        if (date.getYear() == year) {
            events[date.getMonth()][date.getDay()] = 0;
        }
    }

    public String printMonth(int month) {
        StringBuilder sb = new StringBuilder();
        sb.append(getMonthName(month)).append(" ").append(year).append("\n");
        sb.append("Su Mo Tu We Th Fr Sa\n");

        int firstWeekday = getFirstWeekdayOfYear(month);
        int daysInMonth = DateYMD.monthDays(month, year);

        for (int i = 1 ; i < firstWeekday; i++) {
            sb.append("  ");
        }

        for (int i = 1; i <= daysInMonth; i++) {
            if (i < 10) {
                sb.append(" ");
            }
            sb.append(i);
            if (events[month][i] > 0) {
                sb.append("* ");
            } else {
                sb.append("  ");
            }
            if ((firstWeekday + i - 1) % 7 == 0) {
                sb.append("\n");
            }
        }

        if (firstWeekday + daysInMonth - 1 % 7 != 0) {
            sb.append("\n");
        }

        return sb.toString();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (int month = 1; month <= 12; month++) {
            sb.append(printMonth(month));
            sb.append("\n");
        }
        return sb.toString();
    }

    private String getMonthName(int month) {
        switch (month) {
            case 1: return "January";
            case 2: return "February";
            case 3: return "March";
            case 4: return "April";
            case 5: return "May";
            case 6: return "June";
            case 7: return "July";
            case 8: return "August";
            case 9: return "September";
            case 10: return "October";
            case 11: return "November";
            case 12: return "December";
            default: return "Invalid month";
        }
    }
}
