package com.example.api.delivery_backend.controllers;

import com.example.api.delivery_backend.dtos.AuthenticationRecordDto;
import com.example.api.delivery_backend.dtos.RegisterRecordDto;
import com.example.api.delivery_backend.models.UserModel;
import com.example.api.delivery_backend.services.AuthorizationService;
import com.example.api.delivery_backend.services.TokenService;
import com.example.api.delivery_backend.utils.ApiGlobalResponseDto;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
public class AuthenticationController {

    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    AuthorizationService authorizationService;
    @Autowired
    TokenService tokenService;

    @PostMapping("/login")
    public ResponseEntity<ApiGlobalResponseDto> login(@RequestBody @Valid AuthenticationRecordDto dto){
        var usernamePassword =new UsernamePasswordAuthenticationToken(dto.login(), dto.password());
        var auth = this.authenticationManager.authenticate(usernamePassword);

        var token = tokenService.generateToken((UserModel) auth.getPrincipal());

        return ResponseEntity.status(HttpStatus.OK).body(new ApiGlobalResponseDto(token));
    }

    @PostMapping("/register")
    public ResponseEntity<ApiGlobalResponseDto> register(@RequestBody @Valid RegisterRecordDto dto){
        return ResponseEntity.status(HttpStatus.CREATED).body(new ApiGlobalResponseDto(authorizationService.save(dto)));
    }


}
