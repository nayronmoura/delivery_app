package com.example.api.delivery_backend.infra;

import com.example.api.delivery_backend.exceptions.ResourceNotFoundException;
import com.example.api.delivery_backend.utils.ApiGlobalResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.Map;

@ControllerAdvice
public class RestExceptionHandler extends ResponseEntityExceptionHandler {

    @ExceptionHandler(ResourceNotFoundException.class)
    private ResponseEntity<ApiGlobalResponseDto> resourceNotFoundHandler(ResourceNotFoundException resourceNotFoundException){
        Map<String, String> error =Map.of("error", resourceNotFoundException.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ApiGlobalResponseDto(error));
    }
}
