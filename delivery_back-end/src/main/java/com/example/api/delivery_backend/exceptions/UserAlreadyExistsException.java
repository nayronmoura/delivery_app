package com.example.api.delivery_backend.exceptions;


public class UserAlreadyExistsException extends RuntimeException{
    public UserAlreadyExistsException(String login){
        super(String.format("Usuário já cadastrado com login = %s", login));

    }
}
