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
    private double price;
    @Column(nullable = false)
    private Category category;
    private String image;

    public ProductModel(ProductRecordDto dto) {
        this.name = dto.name();
        this.description = dto.description();
        this.price = dto.price();
        this.category = dto.category();
        this.image = dto.image();
    }
}
