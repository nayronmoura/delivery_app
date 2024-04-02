package com.example.api.delivery_backend.services;

import com.example.api.delivery_backend.dtos.RegisterRecordDto;
import com.example.api.delivery_backend.exceptions.UserAlreadyExistsException;
import com.example.api.delivery_backend.models.UserModel;
import com.example.api.delivery_backend.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthorizationService implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByLogin(username);
    }

    public UserDetails save(RegisterRecordDto dto){
        if (userRepository.existsByLogin(dto.login())){
            throw new UserAlreadyExistsException(dto.login());
        }
        String encryptedPassword = new BCryptPasswordEncoder().encode(dto.password());
        UserModel newUser = new UserModel(dto.name(), dto.login(), encryptedPassword, dto.role());
        return userRepository.save(newUser);
    }

}
