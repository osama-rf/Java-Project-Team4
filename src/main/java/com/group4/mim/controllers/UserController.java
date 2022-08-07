package com.group4.mim.controllers;

import com.group4.mim.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        return "index.jsp";
    }


}
