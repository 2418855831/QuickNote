package main.java;

import java.net.http.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        // HttpResponse<String> response = HttpHandler.get(HttpStore.Blog.PALETTE);
        Map<String, String> params = Map.of("username", "root", "password", "pa4w0rd");
        HttpResponse<String> response = HttpHandler.post(HttpStore.User.LOGIN, params);
        Map<String, List<String>> headers = response.headers().map();
        for (Map.Entry<String, List<String>> header: headers.entrySet()) {
            System.out.println(header.getKey() + ": " + header.getValue().get(0));
        }
        System.out.println(headers.get("set-cookie").get(0));
        System.out.println(response.body());
    }
}
