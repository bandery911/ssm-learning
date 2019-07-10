package com.bandery.service.impl;

import com.bandery.dao.UserDao;
import com.bandery.model.User;
import com.bandery.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public List<User> findAll() {
        return userDao.findAll();
    }

    public List<User> findByAddress(String address) {
        return userDao.findByAddress(address);
    }

    public List<User> findUser(String username) {
        return userDao.findUser(username);
    }

    public void addUser(User user) {
        userDao.addUser(user);
    }

    public void delUser(User user) {
        userDao.delUser(user);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }

}
