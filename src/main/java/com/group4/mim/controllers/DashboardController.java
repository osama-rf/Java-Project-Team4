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
        return "dashboard/menus.jsp";
    }

    @RequestMapping(value = "/dashboard/items",method = RequestMethod.GET)
    public String items(
            Model model,
            HttpSession session
    ){
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
            @Valid @ModelAttribute("menu") Menu menu,
            @RequestParam(value = "background_image") MultipartFile background,
            @RequestParam(value = "brand_Logo") MultipartFile brandLogo,
            RedirectAttributes attr,
            BindingResult result,
            HttpSession session
    ){
        User user = userService.findUser(
                (long) session.getAttribute("user_id")
        );

        if(result.hasErrors()){
            attr.addFlashAttribute("errors",result.getFieldErrors());
            return "redirect:/dashboard";
        }
        menu.setUser(user);
        menu.setBrandLogo(menuService.uploadTo("logos",brandLogo));
        menu.setBackground(menuService.uploadTo("backgrounds",background));
        menuService.createMenu(menu);
        return "redirect:/dashboard";
    }

    //====================Category=============================//
    @PostMapping("/dashboard/category/create")
    public String createCategory(
            @Valid @ModelAttribute("category")Category category,
            RedirectAttributes attr,
            BindingResult result,
            HttpSession session
    ){
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
            @Valid @ModelAttribute("item")Item item,
            RedirectAttributes attr,
            @RequestParam(value = "product_image") MultipartFile image,
            BindingResult result,
            HttpSession session
        ) {
        User user = userService.findUser(
                (long) session.getAttribute("user_id")
        );

        if (result.hasErrors()){
            attr.addFlashAttribute("errors", result.getFieldErrors());
            return "redirect:/dashboard";
        }
        item.setImage(itemService.uploadImage(image));
        itemService.createItem(item);
        return "redirect:/dashboard";
    }

    //=========================API=============================//

    @RequestMapping (value = "/api/getCategories/{menu_id}/{user_id}",method = RequestMethod.GET ,produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Object> getCategories(
            @PathVariable(value = "menu_id") long menu_id,
            @PathVariable(value = "user_id") long user_id
    ){
        return categoryService.getCategories(menu_id);
    }
}