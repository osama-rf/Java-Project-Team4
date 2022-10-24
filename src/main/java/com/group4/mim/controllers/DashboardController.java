package com.group4.mim.controllers;

import com.group4.mim.models.Category;
import com.group4.mim.models.Item;
import com.group4.mim.models.Menu;
import com.group4.mim.models.User;
import com.group4.mim.services.*;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

@Controller
public class DashboardController {

    private final UserService userService;
    private final MenuService menuService;
    private final CategoryService categoryService;
    private final ItemService itemService;


    public DashboardController(UserService userService,
                               MenuService menuService,
                               CategoryService categoryService,
                               ItemService itemService
    ){

        this.userService = userService;
        this.menuService = menuService;
        this.categoryService = categoryService;
        this.itemService = itemService;
    }

    @RequestMapping(value = "/dashboard",method = RequestMethod.GET)
    public String dashboard(
            @ModelAttribute("menu") Menu menu,
            @ModelAttribute("category") Category category,
            @ModelAttribute("item") Item item,
            BindingResult result,
            Model model,
            HttpSession session
    ){
        if(!isLogin(session)){
            return "redirect:/";
        }
        model.addAttribute("lang",
                (String) session.getAttribute("lang")
        );
        User user = userService.findUser(
                (long) session.getAttribute("user_id")
        );
        model.addAttribute("countMenus",menuService.countAll(user));
        model.addAttribute("countCategories",categoryService.countAll(user.getId()));
        model.addAttribute("countItems",itemService.countAll(user.getId()));
        model.addAttribute("menus",menuService.allMenusByUser(user));
        model.addAttribute("user",user);
        return "dashboard/dashboard.jsp";
    }

    @RequestMapping(value = "/dashboard/categories",method = RequestMethod.GET)
    public String categories(
            Model model,
            HttpSession session
    ){
        if(!isLogin(session)){
            return "redirect:/";
        }
        model.addAttribute("lang",
                (String) session.getAttribute("lang")
        );
        User user = userService.findUser(
                (long) session.getAttribute("user_id")
        );
        model.addAttribute("countMenus",menuService.countAll(user));
        model.addAttribute("countCategories",categoryService.countAll(user.getId()));
        model.addAttribute("countItems",itemService.countAll(user.getId()));
        model.addAttribute("categories",categoryService.findAllCategoriesForUser(user.getId()));
        model.addAttribute("user",user);
        return "dashboard/categories.jsp";
    }

    @RequestMapping(value = "/dashboard/items",method = RequestMethod.GET)
    public String items(
            Model model,
            HttpSession session
    ){
        if(!isLogin(session)){
            return "redirect:/";
        }
        model.addAttribute("lang",
                (String) session.getAttribute("lang")
        );
        User user = userService.findUser(
                (long) session.getAttribute("user_id")
        );
        model.addAttribute("countMenus",menuService.countAll(user));
        model.addAttribute("countCategories",categoryService.countAll(user.getId()));
        model.addAttribute("countItems",itemService.countAll(user.getId()));
        model.addAttribute("items",itemService.findAllItemsForUser(user.getId()));
        model.addAttribute("user",user);
        return "dashboard/items.jsp";
    }

    //====================Menu=============================//
    @PostMapping("/dashboard/menu/create")
    public String createMenu(
            @RequestParam(value = "background_image") MultipartFile background,
            @RequestParam(value = "brand_Logo") MultipartFile brandLogo,
            @Valid @ModelAttribute("menu") Menu menu,
            BindingResult result,
            RedirectAttributes attr,
            HttpSession session
    ) throws IOException {
        if(!isLogin(session)){
            return "redirect:/";
        }
        User user = userService.findUser(
                (long) session.getAttribute("user_id")
        );

        if(result.hasErrors()){
            attr.addFlashAttribute("errors",result.getFieldErrors());
            return "redirect:/dashboard";
        }
        String brandLogo_path = Base64.getEncoder().encodeToString(brandLogo.getBytes());
        String background_path = Base64.getEncoder().encodeToString(background.getBytes());
        menu.setUser(user);
        menu.setBrandLogo(brandLogo.getBytes());
        menu.setBackground_path(background_path);
        menu.setBrandLogo_path(brandLogo_path);
        menu.setBackground(background.getBytes());
        menuService.createMenu(menu);
        return "redirect:/dashboard";
    }

    //====================Category=============================//
    @PostMapping("/dashboard/category/create")
    public String createCategory(
            @Valid @ModelAttribute("category")Category category,
            BindingResult result,
            RedirectAttributes attr,
            HttpSession session
    ){
        if(!isLogin(session)){
            return "redirect:/";
        }
        User user = userService.findUser(
                (long) session.getAttribute("user_id")
        );

        if (result.hasErrors()){
            attr.addFlashAttribute("errors", result.getFieldErrors());
            return "redirect:/dashboard";
        }
        categoryService.createCategory(category);
        return "redirect:/dashboard";
    }

    //====================Items=============================//
    @PostMapping("/dashboard/item/create")
    public String createItem(
            @RequestParam(value = "product_image") MultipartFile image,
            @Valid @ModelAttribute("item")Item item,
            BindingResult result,
            RedirectAttributes attr,
            HttpSession session
        ) throws IOException {
        if(!isLogin(session)){
            return "redirect:/";
        }
        User user = userService.findUser(
                (long) session.getAttribute("user_id")
        );

        if (result.hasErrors()){
            attr.addFlashAttribute("errors", result.getFieldErrors());
            return "redirect:/dashboard";
        }

        String image_path = Base64.getEncoder().encodeToString(image.getBytes());
        item.setImage_path(image_path);
        item.setImage(image.getBytes());
        itemService.createItem(item);
        return "redirect:/dashboard";
    }

    //=========================API=============================//

    @RequestMapping (value = "/api/getCategories/{menu_id}/{user_id}",method = RequestMethod.GET ,produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Object> getCategories(
            @PathVariable(value = "menu_id") long menu_id,
            @PathVariable(value = "user_id") long user_id
    ){
        if(user_id != menuService.findMenu(menu_id).getUser().getId()){
            return null;
        }
        return categoryService.getCategories(menu_id);
    }


    //=========================Helpers=============================//


    public boolean isLogin(
            HttpSession session
    ){
        return session.getAttribute("user_id") != null;
    }

}