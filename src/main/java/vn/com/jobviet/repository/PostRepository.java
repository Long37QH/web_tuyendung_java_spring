package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    @SuppressWarnings("null")
    List<Post> findAll();

    Post findById(long id);
    
}
