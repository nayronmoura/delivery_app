package com.example.api.delivery_backend.models;


import com.example.api.delivery_backend.dtos.ProductRecordDto;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.UUID;

@Table(name = "tb_product")
@Entity
@Getter
@Setter
@NoArgsConstructor
public class ProductModel implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private String description;
    @Column(nullable = false)
    private Double price;
    @Column(nullable = false)
    private Category category;
    private String image;

    public ProductModel(String name, String description, Double price, Category category, String image){
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.image = image;
    }

}
