package com.group4.mim.repositories;

import com.group4.mim.models.Review;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends CrudRepository <Review, Long> {
    List<Review> findAll();
    
}
