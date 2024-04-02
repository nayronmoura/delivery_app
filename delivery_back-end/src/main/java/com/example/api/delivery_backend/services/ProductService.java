package com.example.api.delivery_backend.services;

import com.example.api.delivery_backend.dtos.FilterProductsRecordDto;
import com.example.api.delivery_backend.dtos.ProductPutRecordDto;
import com.example.api.delivery_backend.dtos.ProductRecordDto;
import com.example.api.delivery_backend.exceptions.ResourceNotFoundException;
import com.example.api.delivery_backend.models.ProductModel;
import com.example.api.delivery_backend.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    @Transactional
    public ProductModel save(ProductRecordDto dto){
        return productRepository.save(new ProductModel(dto.name(), dto.description(), dto.price(),dto.category(), dto.image()));
    }

    public List<ProductModel> findAll(FilterProductsRecordDto dto) {
        if (dto.name() == null && dto.category() == null) return productRepository.findAll();

        if (dto.name() != null && dto.category() != null) return productRepository
                .findAllByNameContainingIgnoreCaseAndCategory(dto.name(), dto.category());

        if (dto.name() != null) return productRepository.findAllByNameContainingIgnoreCase(dto.name());

        return productRepository.findAllByCategory(dto.category());
    }

    @Transactional
    public void deleteById(UUID id){
        var product = productRepository.existsById(id);
        if (!product){
            throw new ResourceNotFoundException("Product" ,"id", id.toString());
        }
        productRepository.deleteById(id);
    }

    @Transactional
    public ProductModel update(ProductPutRecordDto dto, UUID id){


        var product = productRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Product", "id", id.toString()));
        dto.toProduct(product);
        return productRepository.save(product);
    }

}
