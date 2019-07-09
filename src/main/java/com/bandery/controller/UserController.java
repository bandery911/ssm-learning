package com.bandery.controller;

import com.bandery.model.User;
import com.bandery.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("users")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("allusers");
        mv.addObject("users", userService.findAll());
        return mv;
    }

    @RequestMapping(value = "/findById")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        User user = userService.findById(Integer.getInteger(id));
        System.out.println("获取到用户为：" + user);
        mv.setViewName("allusers");
        mv.addObject("user", user);
        return mv;
    }

    @RequestMapping(value = "/delUser")
    public ModelAndView delUser(String userid) throws Exception{
        User delUser = new User();
        delUser.setUserid(Integer.valueOf(userid).intValue());
        userService.delUser(delUser);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("allusers");
        mv.addObject("users", userService.findAll());
        return mv;
    }
}
