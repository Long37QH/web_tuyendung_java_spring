package vn.com.jobviet.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import vn.com.jobviet.domain.Category;
import vn.com.jobviet.service.PostService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import jakarta.validation.Valid;





@Controller
public class PostController {
    private final PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/admin/categorypost")
    public String getPageCateAdmin(Model model) {
        List<Category> listCate = this.postService.getAllCategory();
        model.addAttribute("listCate", listCate);
        return "/admin/post/show_cate";
    }

    @GetMapping("/admin/categorypost/creat")
    public String getPageCrateCate(Model model) {
        model.addAttribute("cateNew", new Category());
        return "/admin/post/creat_cate";
    }

    @PostMapping("/admin/categorypost/creat")
    public String postCreatCtegory(Model model,
            @ModelAttribute("cateNew") @Valid Category catenew,
            BindingResult newCateBindingResult) {
            
        if(newCateBindingResult.hasErrors()){
            return "/admin/post/creat_cate";
        }
        this.postService.handSaveCategory(catenew);
        return "redirect:/admin/categorypost";
    }

    @GetMapping("/admin/categorypost/update/{id}")
    public String getPageUpdateCategory(Model model,@PathVariable long id) {
        Category category = this.postService.getCateById(id);
        model.addAttribute("category", category);
        return "/admin/post/update_cate";
    }
    
    @PostMapping("/admin/categorypost/update")
    public String postUpdareCtegory(Model model,
            @ModelAttribute("category") @Valid Category cateUp,
            BindingResult upCateBindingResult) {
            
        if(upCateBindingResult.hasErrors()){
            return "/admin/post/update_cate";
        }
        Category currenCategory = this.postService.getCateById(cateUp.getId());
        currenCategory.setName(cateUp.getName());
        currenCategory.setDescription(cateUp.getDescription());

        this.postService.handSaveCategory(currenCategory);
        return "redirect:/admin/categorypost";
    }

    @GetMapping("/admin/categorypost/delete/{id}")
    public String getMethodName(Model model,@PathVariable long id) {
        this.postService.deleteCategory(id);
        return "redirect:/admin/categorypost";
    }
    
}
