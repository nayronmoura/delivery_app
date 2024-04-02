package com.example.api.delivery_backend.roles;

public enum UserRole {
    ADMIN("admin"),
    USER("user");
    private final String role;

    UserRole(String role){
        this.role = role;
    }

    public String getRole(){
        return role;
    }

}
