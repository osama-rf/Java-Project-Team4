package com.group4.mim.repositories;

import com.group4.mim.models.Category;
import com.group4.mim.models.Item;
import com.group4.mim.models.Menu;
import com.group4.mim.models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemRepository extends CrudRepository <Item, Long> {
    List<Item> findAll();

//    @Query(value= "select count(i.id) from items i, categories c , users u , menus m , categories_items ci " +
//            "where i.id = ci.item_id and ci.category_id = c.id and c.menu_id = m.id and m.user_id = u.id and u.id = ?1"
//            ,nativeQuery = true)
@Query(value= "select count(i.id) from items i , users u , menus m " +
        "where i.menu_id = m.id and m.user_id = u.id and u.id = ?1"
        ,nativeQuery = true)
    long countAllItems(long user_id);



    List<Item> findByMenuLike(Menu menu);

    @Query(value = "select * from items i , categories_items ci, categories c , menus m " +
            "where i.id = ci.item_id and ci.category_id = c.id and c.menu_id = m.id and m.user_id = ?1" ,nativeQuery = true)
    List<Item> findAllItemsForUser(long user_id);
}
