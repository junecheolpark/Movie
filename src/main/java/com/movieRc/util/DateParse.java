package com.movieRc.util;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class DateParse {
    public static String dataParse (Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simpleDateFormat.format(date);
    }
}
