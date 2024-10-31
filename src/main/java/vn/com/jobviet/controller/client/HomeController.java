package vn.com.jobviet.controller.client;


import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.domain.dto.RegisterDTO;
import vn.com.jobviet.service.JobService;
import vn.com.jobviet.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;



@Controller
public class HomeController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final JobService jobService;
    
    public HomeController(UserService userService,PasswordEncoder passwordEncoder,JobService jobService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.jobService = jobService;
        
    }

    @GetMapping("/")
    public String getHomePage(Model model,@RequestParam("page") Optional<String> pageOptional) {
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
        PageRequest pageable = PageRequest.of(page - 1, 5);
        String status = "Đăng bài";

        Page<Job> prs = this.jobService.GetAllJobByStatusOderbyView(status,pageable);
        List<Job> listjob = prs.getContent();

        model.addAttribute("listjob", listjob);
        //lây so trong hiện tại truyên sang view
        model.addAttribute("curentPage", page);
        // lấy tông số trang
        model.addAttribute("totalPages", prs.getTotalPages());

        return "/client/home/show";
    }
    
    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "/client/auth/register";
    }

    @PostMapping("/register")
    public String postRegister(Model model,@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
    BindingResult bindingResult) {

        //validate
        if(bindingResult.hasErrors()){
            return "/client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        // ma hoa pass
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        // cap nhat lai thong tin vao doi tuong user
        String avatarNew = "creatAvatar.jpg";

        user.setAvatar(avatarNew);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(registerDTO.getRoleName()));
        user.setPlan(this.userService.getPlanById(4));
        user.setNumPost(1);        
        System.out.println("run hear : " + user);
        this.userService.handlSaveUser(user);
        return "redirect:/login";

    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "/client/auth/login";
    }

    @GetMapping("/error-page")
    public String getErrorPage(Model model) {
        return "/client/auth/error_page";
    }

}
