package com.bandery.service;

import com.bandery.BaseTest;
import com.bandery.model.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserServiceImplTest extends BaseTest {

    @Autowired
    private UserService userService;

    @Test
    public void testFindAll() throws Exception{
        List<User> users = userService.findAll();
        for (User user : users){
            System.out.println(user);
        }
    }

    @Test
    public void testFindById() throws Exception{
        User user = userService.findById(2);
        System.out.println(user);
    }

    @Test
    public void testFindByAddress() throws Exception{
        List<User> users = userService.findByAddress("江苏");
        for (User user : users){
            System.out.println(user);
        }
    }

    @Test
    public void testAddUser() throws Exception{
        User user = new User();
        user.setUsername("tank");
        user.setAddress("黑龙江");
        userService.addUser(user);
    }

    @Test
    public void testDelUser() throws Exception{
        User user = new User();
        user.setUserid(6);
        userService.delUser(user);
    }

    @Test
    public void updateUser() throws Exception{
        User user = new User();
        user.setUserid(5);
        user.setUsername("zhangsan");
        user.setAddress("北京");
        userService.updateUser(user);
    }
}
