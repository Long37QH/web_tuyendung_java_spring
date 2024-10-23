package vn.com.jobviet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    
}
