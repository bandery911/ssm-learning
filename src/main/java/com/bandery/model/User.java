package com.bandery.model;

import lombok.Data;

@Data
public class User {

    private int userid;
    private String username;
    private String address;

    @Override
    public String toString() {
        return "[" + userid + ", " + username + ", " + address + "]";
    }
}
