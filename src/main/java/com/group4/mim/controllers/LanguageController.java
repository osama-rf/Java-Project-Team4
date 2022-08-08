package com.group4.mim.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

@Controller
public class LanguageController {

    @GetMapping("/language/{location}/en")
    public String setLangEn(
            HttpSession session,
            @PathVariable(value = "location") String location
    ){
        session.setAttribute("lang","En");
        return "redirect:/"+location;
    }

    @GetMapping("/language/{location}/ar")
    public String setLangAr(
            HttpSession session,
            @PathVariable(value = "location") String location
    ){
        session.setAttribute("lang","ar");
        return "redirect:/"+location;
    }
}
