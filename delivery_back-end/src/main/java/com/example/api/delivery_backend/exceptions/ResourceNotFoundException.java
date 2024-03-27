package com.example.api.delivery_backend.exceptions;


public class ResourceNotFoundException extends RuntimeException{
    public ResourceNotFoundException(String resource, String nameParam, String value){
        super(String.format("%s não encontrado com %s = %s", resource, nameParam, value));

    }
}
