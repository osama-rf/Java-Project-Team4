package com.group4.mim.repositories;

import com.group4.mim.models.Item;
import com.group4.mim.models.Menu;
import com.group4.mim.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemRepository extends CrudRepository <Item, Long> {
    List<Item> findAll();
}
