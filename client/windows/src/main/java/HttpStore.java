package main.java;

abstract public class HttpStore {
    // website's host
    static String HOST = "http://localhost:8000/api/";

    // APIs about users
    static public class User {
        static String LOGIN = HOST + "users/login";
        static String LOGOUT = HOST + "uses/logout";
    }

    // APIs about blogs
    static public class Blog {
        static String INDEX = HOST + "blogs/";
        static String PALETTE = INDEX + "palette";
        static String RENAME = INDEX + "rename";
        static String SAVE = INDEX + "save";
        static String INCRE_VIEWS_COUNT = INDEX + "incre-views-count";
        static String DELETE = INDEX + "delete";
    }

    // APIs about categories
    static public class Category {
        static String INDEX = HOST + "blogs/categories/";
        static String CREATE = INDEX + "create";
        static String RENAME = INDEX + "rename";
        static String DELETE = INDEX + "delete";
    }
}
