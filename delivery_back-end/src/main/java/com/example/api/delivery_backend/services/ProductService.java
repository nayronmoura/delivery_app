package com.example.api.delivery_backend.services;

import com.example.api.delivery_backend.dtos.FilterProductsRecordDto;
import com.example.api.delivery_backend.dtos.ProductRecordDto;
import com.example.api.delivery_backend.models.ProductModel;
import com.example.api.delivery_backend.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;
    public ProductModel save(ProductRecordDto dto){
        return productRepository.save(new ProductModel(dto));
    }

    public List<ProductModel> findAll(FilterProductsRecordDto dto) {
        if (dto.name() == null && dto.category() == null) return productRepository.findAll();

        if (dto.name() != null && dto.category() != null) return productRepository
                .findAllByNameContainingIgnoreCaseAndCategory(dto.name(), dto.category());

        if (dto.name() != null) return productRepository.findAllByNameContainingIgnoreCase(dto.name());

        return productRepository.findAllByCategory(dto.category());
    }


    public List<ProductModel> findByName(String name) {
        return productRepository.findAllByNameContainingIgnoreCase(name);
    }

}
