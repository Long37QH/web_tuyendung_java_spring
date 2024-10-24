package vn.com.jobviet.controller.admin;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import vn.com.jobviet.domain.Category;
import vn.com.jobviet.domain.Post;
import vn.com.jobviet.service.PostService;
import vn.com.jobviet.service.UploadService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;


@Controller
public class PostController {
    private final PostService postService;
    private final UploadService uploadService;

    public PostController(PostService postService, UploadService uploadService) {
        this.postService = postService;
        this.uploadService = uploadService;
    }

    // quan lý danh muc bài viết

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

        if (newCateBindingResult.hasErrors()) {
            return "/admin/post/creat_cate";
        }
        this.postService.handSaveCategory(catenew);
        return "redirect:/admin/categorypost";
    }

    @GetMapping("/admin/categorypost/update/{id}")
    public String getPageUpdateCategory(Model model, @PathVariable long id) {
        Category category = this.postService.getCateById(id);
        model.addAttribute("category", category);
        return "/admin/post/update_cate";
    }

    @PostMapping("/admin/categorypost/update")
    public String postUpdareCtegory(Model model,
            @ModelAttribute("category") @Valid Category cateUp,
            BindingResult upCateBindingResult) {

        if (upCateBindingResult.hasErrors()) {
            return "/admin/post/update_cate";
        }
        Category currenCategory = this.postService.getCateById(cateUp.getId());
        currenCategory.setName(cateUp.getName());
        currenCategory.setDescription(cateUp.getDescription());

        this.postService.handSaveCategory(currenCategory);
        return "redirect:/admin/categorypost";
    }

    @GetMapping("/admin/categorypost/delete/{id}")
    public String getMethodName(Model model, @PathVariable long id) {
        this.postService.deleteCategory(id);
        return "redirect:/admin/categorypost";
    }

    // quan lý bài viết

    @GetMapping("/admin/post")
    public String getPagePostAdmin(Model model) {
        List<Post> listposts = this.postService.getAllPost();
        model.addAttribute("listposts", listposts);
        return "/admin/post/show_post";
    }

    @GetMapping("/admin/post/creat")
    public String getPageCratePost(Model model) {
        model.addAttribute("postNew", new Post());
        return "/admin/post/creat_post";
    }

    @PostMapping("/admin/post/creat")
    public String postCreatPost(Model model,
            @ModelAttribute("postNew") @Valid Post postnew,
            BindingResult newPostBindingResult,
            @RequestParam("fileImage") MultipartFile file) {

        if (newPostBindingResult.hasErrors()) {
            return "/admin/post/creat_post";
        }

        // lay thonhg tin file anh
        String image = this.uploadService.handeSaveUploadFile(file, "post");

        // lấy thời gian
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = currentTime.format(formatter);

        postnew.setImage(image);
        postnew.setTimeposting(formattedDate);
        postnew.setView(1);
        postnew.setCategory(this.postService.getCategoryByName(postnew.getCategory().getName()));

        // System.out.println("run hear : " + postnew);
        this.postService.handSavePost(postnew);

        return "redirect:/admin/post";
    }

    @GetMapping("/admin/post/update/{id}")
    public String getPageUpdatePost(Model model, @PathVariable long id) {
        Post post = this.postService.getPostById(id);
        model.addAttribute("post", post);
        return "/admin/post/update_post";
    }

    @PostMapping("/admin/post/update")
    public String postMethodName(Model model,
            @ModelAttribute("post") @Valid Post postUp,
            BindingResult upPostBindingResult,
            @RequestParam("fileImage") MultipartFile file) {

        if(upPostBindingResult.hasErrors()){
            return "/admin/post/update_post";
        }

        Post currenPost = this.postService.getPostById(postUp.getId());
        if(currenPost != null){
            if(!file.isEmpty()){
                String image = this.uploadService.handeSaveUploadFile(file, "post");
                currenPost.setImage(image);
            }
            // lấy thời gian
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String formattedDate = currentTime.format(formatter);

            currenPost.setTimeposting(formattedDate);
            currenPost.setTitle(postUp.getTitle());
            currenPost.setAuthor(postUp.getAuthor());
            currenPost.setStatus(postUp.getStatus());
            currenPost.setShortdesc(postUp.getShortdesc());
            currenPost.setContent(postUp.getContent());
            currenPost.setCategory(this.postService.getCategoryByName(postUp.getCategory().getName()));

            this.postService.handSavePost(currenPost);
        }

        return "redirect:/admin/post";
    }

    @GetMapping("/admin/post/delete/{id}")
    public String getdeletePost(Model model, @PathVariable long id) {
        this.postService.deletePost(id);
        return "redirect:/admin/post";
    }


}
