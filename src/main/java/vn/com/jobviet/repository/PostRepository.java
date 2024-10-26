package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Category;
import vn.com.jobviet.domain.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {

    @SuppressWarnings("null")
    List<Post> findAll();

    Post findById(long id);

    List<Post> findByCategory(Category category);

    @SuppressWarnings("null")
    Page<Post> findAll(Pageable page);

    //lây post theo phân trang
    Page<Post> findByCategoryAndStatus(Category category,Pageable page,String status);

    @Query("SELECT p.category.name, COUNT(p) FROM Post p GROUP BY p.category.name")
    List<Object[]> countPostsByCategory();
    
}
