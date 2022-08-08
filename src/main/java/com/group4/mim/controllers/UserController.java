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
import javax.validation.Valid;

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
            @Valid @ModelAttribute("register") User register,
            BindingResult result,
            RedirectAttributes attr,
            HttpSession session
    ){
        User user = userService.register(register,result);
        if(result.hasErrors()){
            attr.addFlashAttribute("errors",result.getFieldErrors());
            return "redirect:/home";
        }else{
            session.setAttribute("user_id",user.getId());
            return "redirect:/dashboard";
        }
    }

    @PostMapping("/login")
    public String login(
            @Valid @ModelAttribute("login") Login login,
            BindingResult result,
            RedirectAttributes attr,
            HttpSession session
    ){
        User user = userService.login(login,result);
        if(result.hasErrors()){
            attr.addFlashAttribute("errors",result.getFieldErrors());
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
        if(session.getAttribute("user_id") == null){
            return "redirect:/";
        }
        session.removeAttribute("user_id");
        return "redirect:/";

    }
}
