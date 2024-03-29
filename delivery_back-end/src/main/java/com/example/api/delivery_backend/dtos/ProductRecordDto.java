package com.example.api.delivery_backend.dtos;

import com.example.api.delivery_backend.models.Category;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ProductRecordDto(@NotNull(message = "O campo não pode ser nulo")
                               @NotBlank(message = "O campo não pode estar em branco") String name,
                               @NotNull(message = "O campo não pode ser nulo")
                               @NotBlank(message = "O campo não pode estar em branco") String description,
                               @NotNull(message = "O campo não pode ser nulo")  Double price,
                               @NotNull(message = "O campo não pode ser nulo")  Category category,
                               String image) {

}
