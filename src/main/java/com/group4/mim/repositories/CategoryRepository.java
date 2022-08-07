package com.group4.mim.repositories;

import com.group4.mim.models.Category;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends CrudRepository <Category, Long> {
    List<Category> findAll();
}
