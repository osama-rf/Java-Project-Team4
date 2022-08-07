package com.group4.mim.services;

import com.group4.mim.models.Category;
import com.group4.mim.repositories.CategoryRepository;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public void updateCategory(Category c , long id){
        Optional<Category> category = categoryRepository.findById(id);
        if(category.isPresent()){
            category.get().setName_ar(c.getName_ar());
            category.get().setName_en(c.getName_en());
            categoryRepository.save(category.get());
        }
    }

    public Category findCategory(long id) {
        Optional<Category> category = categoryRepository.findById(id);
        if (category.isPresent()) {
            return category.get();
        } else {
            return null;
        }
    }
        public void createCategory(Category c ) {
            categoryRepository.save(c);
        }


    public void deleteCategory(long id){
        Optional<Category> category = categoryRepository.findById(id);
        if(category.isPresent()){
           categoryRepository.delete(category.get());
        }
    }


}
