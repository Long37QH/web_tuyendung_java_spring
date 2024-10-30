package vn.com.jobviet.controller.admin;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.Role;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.JobService;
import vn.com.jobviet.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;








@Controller
public class EmployeController {
    private final UserService userService;
    private final JobService jobService;
    public EmployeController(UserService userService, JobService jobService) {
        this.userService = userService;
        this.jobService = jobService;
    }

    @GetMapping("/admin/tuyendung")
    public String getPageAdminTuyendung(Model model) {
        Role role = this.userService.getRoleByName("USER1");
        List<User> listUser = this.userService.getListUserByRole(role);
        model.addAttribute("listUser", listUser);
        return "/admin/tuyendung/listtk_tuyendung";
    }

    @GetMapping("/admin/tuyendung/{id}")
    public String getInfoTuyendung(Model model,@PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "/admin/tuyendung/tuyendung_info";
    }
    
    @GetMapping("/admin/tuyendung/ds_chodang")
    public String getPageAdminDsChoDangTD(Model model) {
        List<Job> listjob = this.jobService.getListJobByStatus("Chờ duyệt");
        model.addAttribute("listjob", listjob);
        return "/admin/tuyendung/ds_baitdchoduyet";
    }
    
    @GetMapping("/admin/tuyendung/dangbai/{id}")
    public String getMethodName(Model model,@PathVariable long id,RedirectAttributes redirectAttributes) {
        Job currenJob = this.jobService.getJobById(id);
        currenJob.setStatus("Đăng bài");
        this.jobService.handSaveJob(currenJob);
        redirectAttributes.addFlashAttribute("message", "Đăng bài thành công!");
        return "redirect:/admin/tuyendung/ds_baidang";
    }

    @GetMapping("/admin/tuyendung/ds_baidang")
    public String getPageAdminDsbaiDangTD(Model model) {
        List<Job> listjob = this.jobService.getListJobByStatus("Đăng bài");
        model.addAttribute("listjob", listjob);
        return "/admin/tuyendung/ds_baidang";
    }

    @GetMapping("/admin/tuyendung/detail/{id}")
    public String getPageAdminDetailbaiDangTD(Model model,@PathVariable long id) {
        Job job = this.jobService.getJobById(id);
        model.addAttribute("jobup", job);
        return "/admin/tuyendung/detailTD";
    }

    @PostMapping("/admin/tuyendung/dangbai")
    public String postDangBai(Model model,
            @ModelAttribute("jobup") @Valid Job jobup,
            BindingResult jobupBindingResult,
            RedirectAttributes redirectAttributes) {
        if (jobupBindingResult.hasErrors()) {
            return "/admin/tuyendung/detailTD";
        }
        Job currenJob = this.jobService.getJobById(jobup.getId());
        if (currenJob != null){
            currenJob.setStatus("Đăng bài");
            this.jobService.handSaveJob(currenJob);
            redirectAttributes.addFlashAttribute("message", "Đăng bài thành công!");
        }
        return "redirect:/admin/tuyendung/ds_baidang";
    }

    // xoa job
    @GetMapping("/admin/tuyendung/delete/{id}")
    public String deleteJob(Model model, @PathVariable long id, RedirectAttributes redirectAttributes) {
        this.jobService.deleteJobById(id);
        redirectAttributes.addFlashAttribute("message", "Xóa bài thành công!");
        return "redirect:/admin/tuyendung/ds_baidang";
    }
    
    
}
