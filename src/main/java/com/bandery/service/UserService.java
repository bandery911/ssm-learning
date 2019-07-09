package com.bandery.service;

import com.bandery.model.User;

import java.util.List;

public interface UserService {

    public List<User> findAll();

    public List<User> findByAddress(String address);

    public User findById(int userid);

    public void addUser(User user);

    public void delUser(User user);

    public void updateUser(User user);

}
