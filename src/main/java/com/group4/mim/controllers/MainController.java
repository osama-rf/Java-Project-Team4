package com.group4.mim.controllers;

import com.group4.mim.models.Login;
import com.group4.mim.models.Menu;
import com.group4.mim.models.User;
import com.group4.mim.services.ItemService;
import com.group4.mim.services.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    private final MenuService menuService;
    private final ItemService itemService;

    public MainController(MenuService menuService, ItemService itemService) {
        this.menuService = menuService;
        this.itemService = itemService;
    }

    @GetMapping("/")
    public String index(){
        return "redirect:/home";
    }

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String Home(
            @ModelAttribute("login_form") Login login,
            @ModelAttribute("register_form") User register,
            Model model,
            HttpSession session
    ){
        if(session.getAttribute("user_id") == null){
            session.setAttribute("loggedin",false);
        }else{
            session.setAttribute("loggedin",true);
        }
        if(session.getAttribute("login") == null){
            session.setAttribute("login",false);
        }
        model.addAttribute("lang",
                (String) session.getAttribute("lang")
        );
        model.addAttribute("login",
                (boolean) session.getAttribute("login")
        );

        model.addAttribute("menus",menuService.allMenus());
        model.addAttribute("ourMenus",menuService.Top6());
        return "index.jsp";
    }

    @GetMapping("/menu/{menu_id}")
    public String showMenu(
            @PathVariable(value = "menu_id") long menu_id,
            Model model,
            HttpSession session
    ){
        model.addAttribute("lang",
                (String) session.getAttribute("lang")
        );
        model.addAttribute("menu", menuService.findMenu(menu_id));
        Menu menu = menuService.findMenu(menu_id);
        model.addAttribute("all_items",itemService.findAllItemsForMenus(menu));
        return "show_menu.jsp";
    }

}
