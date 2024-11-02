package vn.com.jobviet.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.com.jobviet.service.JobService;
import vn.com.jobviet.service.PostService;
import vn.com.jobviet.service.UserService;

@Controller
public class DashboardController {
    private final UserService userService;
    private final PostService postService;
    private final JobService jobService;

    
    public DashboardController(UserService userService, PostService postService, JobService jobService) {
        this.userService = userService;
        this.postService = postService;
        this.jobService = jobService;
    }


    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        long user_ungvien = this.userService.countUsersWithRole("USER2");
        long user_tuyendung = this.userService.countUsersWithRole("USER1");
        long job_number = this.jobService.countJobsWithStatus("Đăng bài");
        long post_number = this.postService.countPostsWithStatus("Đăng bài");
        model.addAttribute("job_number", job_number);
        model.addAttribute("user_ungvien", user_ungvien);
        model.addAttribute("user_tuyendung", user_tuyendung);
        model.addAttribute("post_number", post_number);
        return "/admin/dashboard/show";
    }
}
