package com.group4.mim.repositories;

import com.group4.mim.models.Menu;
import com.group4.mim.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuRepository extends CrudRepository <Menu, Long> {
    List<Menu> findAll();
    List<Menu> findByUserLike(User user);
    long countByUserLike(User user);
}
