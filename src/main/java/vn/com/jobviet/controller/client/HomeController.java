package vn.com.jobviet.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
    @GetMapping("/")
    public String getMethodName() {
        return "/client/home/show";
    }
    
    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        return "/client/auth/register";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "/client/auth/login";
    }
}
