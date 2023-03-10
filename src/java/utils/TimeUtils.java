package utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.StringTokenizer;

public class TimeUtils {

    public static String currentTimeString() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now);
    }

    public static String renderedTime(String time) {
        try {
            StringTokenizer stk = new StringTokenizer(time);
            String day = stk.nextToken();
            String hour = stk.nextToken().substring(0, 8);
            StringTokenizer stk2 = new StringTokenizer(day, "-");
            String yyyy = stk2.nextToken();
            String mm = stk2.nextToken();
            String dd = stk2.nextToken();
            day = dd + "-" + mm + "-" + yyyy;
            time = hour + " | " + day;
        } catch (Exception e) {
            return "null";
        }
        return time;
    }

}
