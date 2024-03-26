package com.example.api.delivery_backend.repositories;

import com.example.api.delivery_backend.models.Category;
import com.example.api.delivery_backend.models.ProductModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
@Repository
public interface ProductRepository extends JpaRepository<ProductModel, UUID> {
   List<ProductModel> findAllByCategory(Category category);
   List<ProductModel> findAllByNameContainingIgnoreCase(String name);
   List<ProductModel> findAllByNameContainingIgnoreCaseAndCategory(String name, Category category);
}
