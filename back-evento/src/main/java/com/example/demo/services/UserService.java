package com.example.demo.services;

import com.example.demo.models.User;

import java.util.List;

public interface UserService {

    User save(User user);
    List<User> findAll();
    User getUserById(Long id);
    User update(User user, Long id);

    void delete(Long id);

}
