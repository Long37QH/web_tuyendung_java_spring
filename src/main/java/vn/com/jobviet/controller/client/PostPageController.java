package vn.com.jobviet.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.jobviet.domain.Category;
import vn.com.jobviet.domain.Post;
import vn.com.jobviet.service.PostService;

@Controller
public class PostPageController {
    private final PostService postService;

    public PostPageController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/post")
    public String getPagePost(Model model,
            @RequestParam("category") Optional<String> categoryOptional,
            @RequestParam("page") Optional<String> pageOptional) {
        
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }else{
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
        }

        String inputName = categoryOptional.get();
        String cateName = inputName.replace("-", " ");

        Category category = this.postService.getCategoryByName(cateName);

        PageRequest pageable = PageRequest.of(page - 1, 5);
        String status = "Đăng bài";

        Page<Post> prs = this.postService.getAllPostByCategorys(category, pageable, status);

        List<Post> listPost = prs.getContent();
        model.addAttribute("category", category);
        model.addAttribute("listPost", listPost);
        model.addAttribute("linkcate", inputName);

        List<Object[]> result = this.postService.PostCountByCategory();
        model.addAttribute("result", result);

        //lây so trong hiện tại truyên sang view
        model.addAttribute("curentPage", page);
        // lấy tông số trang
        model.addAttribute("totalPages", prs.getTotalPages());
        return "/client/post/show";
    }

    @GetMapping("/post/{id}")
    public String getPostDetailPage(Model model,@PathVariable long id) {
        Post post = this.postService.getPostById(id);
        long viewup = post.getView() + 1;
        post.setView(viewup);
        this.postService.handSavePost(post);
        List<Object[]> result = this.postService.PostCountByCategory();
        model.addAttribute("result", result);
        model.addAttribute("post", post);
        return "/client/post/post_detail";
    }
    
}
