package com.example.api.delivery_backend.infra;

import com.example.api.delivery_backend.exceptions.ResourceNotFoundException;
import com.example.api.delivery_backend.utils.ApiGlobalResponseDto;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class RestExceptionHandler {
    @ExceptionHandler
    private ResponseEntity<ApiGlobalResponseDto> handleMethodArgumentNotValid(MethodArgumentNotValidException exception){
        Map<String, String> errors = new HashMap<>();
        exception.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String message = error.getDefaultMessage();
            errors.put(fieldName, message);
        });

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ApiGlobalResponseDto(errors));
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    private ResponseEntity<ApiGlobalResponseDto> resourceNotFoundHandler(ResourceNotFoundException resourceNotFoundException){
        Map<String, String> error = Map.of("error", resourceNotFoundException.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ApiGlobalResponseDto(error));
    }

}
