package com.example.api.delivery_backend.dtos;

import com.example.api.delivery_backend.models.Category;
import com.example.api.delivery_backend.models.ProductModel;

public record ProductPutRecordDto(String name, String description, Double price, Category category, String image) {
    public void toProduct(ProductModel product){
        if (name  != null){
            product.setName(name);
        }
        if (description  != null){
            product.setDescription(description);
        }
        if (price  != null){
            product.setPrice(price);
        }
        if (category != null){
            product.setCategory(category);
        }
        if (image != null){
            product.setImage(image);
        }
    }
}
