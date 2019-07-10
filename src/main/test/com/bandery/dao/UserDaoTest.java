package com.bandery.dao;

import com.bandery.BaseTest;
import com.bandery.model.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserDaoTest extends BaseTest {

    @Autowired
    private UserDao userDao;

    @Test
    public void testFindAll() throws Exception {
        List<User> users = userDao.findAll();
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void testFindUser() throws Exception {
        List<User> users = userDao.findUser("ryan");
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void testFindByAddress() throws Exception {
        List<User> users = userDao.findByAddress("江苏");
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void testAddUser() throws Exception {
        User user = new User();
        user.setUsername("f567");
        user.setAddress("新西兰");
        userDao.addUser(user);
    }

    @Test
    public void testDelUser() throws Exception {
        User user = new User();
        user.setUserid(2);
        userDao.delUser(user);
    }

    @Test
    public void updateUser() throws Exception {
        User user = new User();
        user.setUserid(13);
        user.setUsername("zhangsan");
        user.setAddress("黎巴嫩");
        userDao.updateUser(user);
    }

}
