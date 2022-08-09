package com.group4.mim.repositories;

import com.group4.mim.models.Category;
import com.group4.mim.models.Menu;
import com.group4.mim.models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends CrudRepository <Category, Long> {
    List<Category> findAll();
    @Query(value = "select * from categories c , menus m where c.menu_id = m.id and m.user_id = ?1",nativeQuery = true)
    List<Category> findAllCategoriesForUser(long user_id);
    @Query(value = "SELECT id,name_en,name_ar FROM categories WHERE menu_id = ?1",nativeQuery = true)
    List<Object> getCategories(long menu);



    @Query(value= "select count(c.id) from categories c , users u , menus m" +
            " where c.menu_id = m.id and m.user_id = u.id and u.id = ?1" ,nativeQuery = true)
    long countAllCategories(long user_id);
}
