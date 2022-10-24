package com.group4.mim.services;

import com.group4.mim.models.Menu;
import com.group4.mim.models.User;
import com.group4.mim.repositories.MenuRepository;
import org.apache.commons.lang3.RandomStringUtils;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class MenuService {

    private final MenuRepository menuRepository;
    private final HttpServletRequest request;

    public MenuService(MenuRepository menuRepository, HttpServletRequest request) {
        this.menuRepository = menuRepository;
        this.request = request;
    }

    public List<Menu> allMenus(){
        return menuRepository.findAll();
    }

    public Menu showMenu(long id){
        Optional<Menu> menu = menuRepository.findById(id);
        if(menu.isPresent()){
            return menu.get();
        }else{
            return null;
        }
    }


    public void createMenu(Menu m){
        menuRepository.save(m);
    }

    public String uploadTo(String dir, MultipartFile multipartFile){
        if(multipartFile.isEmpty()){
            return null;
        }else{
            try {
                String path = request.getServletContext().getRealPath(String.format("/resources/static/uploads/%s/",dir));
                System.out.println(path);
                String date = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss").format(new Date());
                String random = RandomStringUtils.random(10,true,false);
                String filename = date + random + ".jpg";
                String databasefilename = String.format("image/%s/%s",dir,filename);
                String filePath = path + filename;
                multipartFile.transferTo(new File(filePath));
                return databasefilename;
            }catch (Exception e){
                return null;
            }
        }
    }

    // Update Menu
    public void updateMenu(Menu m, long id){
        Optional<Menu> menu = menuRepository.findById(id);
        if (menu.isPresent()){
            menu.get().setBrandName_en(m.getBrandName_en());
            menu.get().setBrandName_ar(m.getBrandName_ar());
            menu.get().setBackground(m.getBackground());
            menu.get().setBrandLogo(m.getBrandLogo());
            menu.get().setCategories(m.getCategories());
            menuRepository.save(menu.get());
        }
    }

    // Delete Menu
    public void deleteMenu(long id){
        Optional<Menu> menu = menuRepository.findById(id);
        if(menu.isPresent()){
            menuRepository.delete(menu.get());
        }
    }

    public List<Menu> allMenusByUser(User user){
        return menuRepository.findByUserLike(user);
    }

    public Menu findMenu(long id){
        Optional<Menu> menu = menuRepository.findById(id);
        if(menu.isPresent()){
            return menu.get();
        }else{
            return null;
        }
    }

    public long countAll(User user){
        return menuRepository.countByUserLike(user);
    }

    public List<Menu> Top6(){
        return menuRepository.findTop6ByOrderByCreatedAtAsc();
    }
}
