package com.bandery.dao;

import com.bandery.model.User;

import java.util.List;

public interface UserDao {

    public List<User> findAll();

    public List<User> findByAddress(String address);

    public List<User> findUser(String username);

    public void addUser(User user);

    public void delUser(User user);

    public void updateUser(User user);

}
