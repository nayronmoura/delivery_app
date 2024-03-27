package com.example.api.delivery_backend.services;

import com.example.api.delivery_backend.dtos.FilterProductsRecordDto;
import com.example.api.delivery_backend.dtos.ProductRecordDto;
import com.example.api.delivery_backend.models.ProductModel;
import com.example.api.delivery_backend.repositories.ProductRepository;
import org.springframework.beans.BeanUtils;
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
        return productRepository.save(new ProductModel(dto));
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
        if (product){
            productRepository.deleteById(id);
        }
    }

    public ProductModel update(ProductRecordDto dto, UUID id){
        var product = productRepository.findById(id);
        if (product.isPresent()){
            BeanUtils.copyProperties(dto, product.get());
            return productRepository.save(product.get());
        }
        return null;
    }

}
