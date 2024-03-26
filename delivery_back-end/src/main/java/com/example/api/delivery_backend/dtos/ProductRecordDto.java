package com.example.api.delivery_backend.dtos;

import com.example.api.delivery_backend.models.Category;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ProductRecordDto(@NotNull @NotBlank String name,
                               @NotNull @NotBlank String description,
                               double price,
                               @NotNull Category category,
                               String image) {

}
