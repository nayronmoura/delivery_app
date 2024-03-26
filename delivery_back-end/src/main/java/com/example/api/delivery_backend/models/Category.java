package com.example.api.delivery_backend.models;

public enum Category {
    ALIMENTO("alimento"),
    BEBIDA("bebida"),
    VARIEDADES("variedades"),
    MERCADO("mercado"),
    LANCHES("lanches"),
    REFEICAO("refeicao"),
    GELADO("gelados"),
    FARMACIA("farmacia");
    private String category;


    Category(String category) {
        this.category = category;
    }
}
