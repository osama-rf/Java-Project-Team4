package com.group4.mim.services;

import com.group4.mim.models.Menu;
import com.group4.mim.repositories.MenuRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MenuService {

    private final MenuRepository menuRepository;

    public MenuService(MenuRepository menuRepository) {
        this.menuRepository = menuRepository;
    }

    public Menu showMenu(long id){
        Optional<Menu> menu = menuRepository.findById(id);
        if(menu.isPresent()){
            return menu.get();
        }else{
            return null;
        }
    }

//    public void createMenu(Menu m){
//        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
//        user.setPhotos(fileName);
//        User savedUser = repo.save(user);
//        String uploadDir = "user-photos/" + savedUser.getId();
//        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
//        menuRepository.save(m);
//    }

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
        menuRepository.deleteById(id);
    }
}
