package main.java;

import java.net.URI;
import java.net.http.*;
import java.net.http.HttpResponse.BodyHandlers;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.*;

abstract public class HttpHandler {
    // global HttpClient
    static HttpClient httpClient = HttpClient.newBuilder()
            .version(HttpClient.Version.HTTP_1_1)
            .followRedirects(HttpClient.Redirect.ALWAYS)
            .connectTimeout(Duration.ofSeconds(10))
            .build();

    static public HttpResponse<String> get(String uri) throws Exception {
        HttpRequest httpRequest = HttpRequest.newBuilder()
                .uri(URI.create(uri))
                .GET()
                .build();
        return httpClient.send(httpRequest, BodyHandlers.ofString(StandardCharsets.UTF_8));
    }

    static public HttpResponse<String> post(String uri, Map<String, String> params) throws Exception {
        String body = "";
        for(Map.Entry<String, String> param: params.entrySet()) {
            body += param.getKey() + "=" + param.getValue() + "&";
        }
        body = body.substring(0, body.length() - 1); // [start, end)
        HttpRequest httpRequest = HttpRequest.newBuilder()
                .uri(URI.create(uri))
                .header("Content-Type", "application/x-www-form-urlencoded")
                .POST(HttpRequest.BodyPublishers.ofString(body, StandardCharsets.UTF_8))
                .build();
        return httpClient.send(httpRequest, BodyHandlers.ofString(StandardCharsets.UTF_8));
    }

    static private void parseHeaders(HttpHeaders httpHeaders) {
        Map<String, List<String>> headers = httpHeaders.map();
        List<String> setCookieList = headers.get("set-cookie");
        if (setCookieList != null) {
            // TODO: split list
        }
    }
}
