package com.group4.mim.services;

import antlr.StringUtils;
import com.group4.mim.models.Menu;
import com.group4.mim.repositories.MenuRepository;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@Service
public class MenuService {

    private final MenuRepository menuRepository;
    private final HttpServletRequest request;

    public MenuService(MenuRepository menuRepository, HttpServletRequest request) {
        this.menuRepository = menuRepository;
        this.request = request;
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

                String path = request.getServletContext().getRealPath(String.format("/uploads/%s/",dir));
                String date = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss").format(new Date());
                String random = RandomStringUtils.random(10,true,false);
                String filename = date + random + ".jpg";
                String filePath = path + filename;
                multipartFile.transferTo(new File(filePath));
                return filePath;
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
}
