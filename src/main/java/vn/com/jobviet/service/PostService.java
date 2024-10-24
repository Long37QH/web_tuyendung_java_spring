package vn.com.jobviet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.com.jobviet.domain.Category;
import vn.com.jobviet.domain.Post;
import vn.com.jobviet.repository.CategoryRepository;
import vn.com.jobviet.repository.PostRepository;

@Service
public class PostService {
    private final PostRepository postRepository;
    private final CategoryRepository categoryRepository;

    public PostService(PostRepository postRepository, CategoryRepository categoryRepository) {
        this.postRepository = postRepository;
        this.categoryRepository = categoryRepository;
    }
    
    public List<Category> getAllCategory(){
        return this.categoryRepository.findAll();
    }

    public List<Post> getAllPost(){
        return this.postRepository.findAll();
    }

    public Category handSaveCategory(Category category){
        Category categoryNew = this.categoryRepository.save(category);
        System.out.println(categoryNew);
        return categoryNew;
    }

    public Post handSavePost(Post post){
        Post postNew = this.postRepository.save(post);
        System.out.println(postNew);
        return postNew;
    }

    public Category getCateById(long id){
        return this.categoryRepository.findById(id);
    }

    public Category getCategoryByName(String name){
        return this.categoryRepository.findByName(name);
    }

    public Post getPostById(long id){
        return this.postRepository.findById(id);
    }

    public void deleteCategory(long id){
        this.categoryRepository.deleteById(id);
    }

    public void deletePost(long id){
        this.postRepository.deleteById(id);
    }
}