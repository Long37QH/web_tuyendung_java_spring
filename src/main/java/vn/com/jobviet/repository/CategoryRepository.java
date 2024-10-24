package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Category;


@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    
    @SuppressWarnings("null")
    List<Category> findAll();

    Category findById(long id);

    Category findByName(String name);
    
}
