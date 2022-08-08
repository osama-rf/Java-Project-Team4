package com.group4.mim.controllers;

import com.group4.mim.models.Login;
import com.group4.mim.models.User;
import com.group4.mim.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/{location}/login")
    public String setLogin(
            @PathVariable(value = "location") String location,
            HttpSession session
    ){
        session.setAttribute("login",true);
        return "redirect:/" + location;
    }

    @GetMapping("/{location}/register")
    public String setRegister(
            @PathVariable(value = "location") String location,
            HttpSession session
    ){
        session.setAttribute("login",false);
        return "redirect:/" + location;
    }

    @PostMapping("/register")
    public String Register(
            @ModelAttribute("register") User register,
            BindingResult result,
            RedirectAttributes attr,
            HttpSession session
    ){
        User user = userService.register(register,result);
        if(result.hasErrors()){
            return "redirect:/home";
        }else{
            session.setAttribute("user_id",user.getId());
            return "redirect:/dashboard";
        }
    }

    @PostMapping("/login")
    public String login(
            @ModelAttribute("login") Login login,
            BindingResult result,
            RedirectAttributes attr,
            HttpSession session
    ){
        User user = userService.login(login,result);
        if(result.hasErrors()){

            return "redirect:/home";
        }else{
            session.setAttribute("user_id",user.getId());
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/logout")
    public String logout(
            HttpSession session
    ) {
        session.removeAttribute("user_id");
        return "redirect:/";

    }
}
