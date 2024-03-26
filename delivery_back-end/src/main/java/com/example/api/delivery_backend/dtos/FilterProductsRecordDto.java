package com.example.api.delivery_backend.dtos;

import com.example.api.delivery_backend.models.Category;

public record FilterProductsRecordDto(Category category, String name) {
}
