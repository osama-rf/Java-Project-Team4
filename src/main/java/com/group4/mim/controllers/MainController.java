package com.group4.mim.controllers;

import com.group4.mim.models.Login;
import com.group4.mim.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @GetMapping("/")
    public String index(){
        return "redirect:/home";
    }

    @RequestMapping(value = "/dashboard",method = RequestMethod.GET)
    public String dashboard(
            Model model,
            HttpSession session
    ){
        model.addAttribute("lang",
                (String) session.getAttribute("lang")
        );
        return "dashboard/index.jsp";
    }




    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String Home(
            @ModelAttribute("login") Login login,
            @ModelAttribute("register") User register,
            Model model,
            HttpSession session
    ){
        if(session.getAttribute("login") == null){
            session.setAttribute("login",false);
        }
        model.addAttribute("lang",
                (String) session.getAttribute("lang")
        );
        model.addAttribute("login",
                (boolean) session.getAttribute("login")
        );
        return "index.jsp";
    }

}