package com.group4.mim.services;

import com.group4.mim.models.Category;
import com.group4.mim.models.Item;
import com.group4.mim.models.Menu;
import com.group4.mim.models.User;
import com.group4.mim.repositories.CategoryRepository;
import com.group4.mim.repositories.ItemRepository;
import com.group4.mim.repositories.MenuRepository;

import java.util.ArrayList;
import java.util.List;

public class DashboardService {
    private final CategoryRepository categoryRepository;
    private final ItemRepository itemRepository;
    private final MenuRepository menuRepository;

    public DashboardService(CategoryRepository categoryRepository, ItemRepository itemRepository, MenuRepository menuRepository) {
        this.categoryRepository = categoryRepository;
        this.itemRepository = itemRepository;
        this.menuRepository = menuRepository;
    }

//    public List lastAdded(User user){
//        List<Menu> menus = menuRepository.findByUserLike(user);
//        List<Category> categories = categoryRepository.findByMenuIn(menus);
//
//        ArrayList list = new ArrayList();
//        for(Menu m: menus){
//            list.add(m);
//        }
//        for(Category c: categories){
//            list.add(c);
//        }
//        ;
//
//    }
}
