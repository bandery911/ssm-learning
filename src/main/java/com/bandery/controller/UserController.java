package com.bandery.controller;

import com.bandery.model.User;
import com.bandery.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("users")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("allusers");
        mv.addObject("users", userService.findAll());
        return mv;
    }

    @RequestMapping(value = "/updateUser")
    public String updateUser(String userid, String address) throws Exception {
        User user = new User();
        user.setUserid(Integer.valueOf(userid).intValue());
        user.setAddress(address);
        userService.updateUser(user);
        return "redirect:list";
    }

    @RequestMapping(value = "/findUser")
    public ModelAndView findUser(String username) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findUser(username);
        mv.setViewName("allusers");
        mv.addObject("users", users);
        return mv;
    }

    @RequestMapping(value = "/delUser")
    public String delUser(String userid) throws Exception {
        User delUser = new User();
        delUser.setUserid(Integer.valueOf(userid).intValue());
        userService.delUser(delUser);
        return "redirect:list";
    }

    @RequestMapping(value = "/addUser")
    public String addUser(String username, String address) throws Exception {
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setAddress(address);
        userService.addUser(newUser);
        return "redirect:list";
    }

}
