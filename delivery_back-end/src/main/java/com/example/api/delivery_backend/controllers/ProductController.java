package com.example.api.delivery_backend.controllers;

import com.example.api.delivery_backend.dtos.FilterProductsRecordDto;
import com.example.api.delivery_backend.dtos.ProductPutRecordDto;
import com.example.api.delivery_backend.dtos.ProductRecordDto;
import com.example.api.delivery_backend.services.ProductService;
import com.example.api.delivery_backend.utils.ApiGlobalResponseDto;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/product")
@Validated
public class ProductController {
    @Autowired
    private ProductService productService;

    @PostMapping
    public ResponseEntity<ApiGlobalResponseDto> saveProduct(@RequestBody @Valid ProductRecordDto dto){
        return ResponseEntity.status(HttpStatus.CREATED).body(new ApiGlobalResponseDto(productService.save(dto)));
    }

    @PostMapping("/filtered")
    public ResponseEntity<ApiGlobalResponseDto> getAllProdutcsWithFilter(@RequestBody FilterProductsRecordDto dto){
        return ResponseEntity.status(HttpStatus.OK).body(new ApiGlobalResponseDto(productService.findAll(dto)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiGlobalResponseDto> update(@RequestBody @Valid ProductPutRecordDto dto
            , @PathVariable(value = "id") UUID id){
        return ResponseEntity.status(HttpStatus.OK).body(new ApiGlobalResponseDto(productService.update(dto, id)));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deleteById(@PathVariable(value = "id") UUID id){
        productService.deleteById(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }


}
