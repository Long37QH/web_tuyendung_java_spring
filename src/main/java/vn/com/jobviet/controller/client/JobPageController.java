package vn.com.jobviet.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobPageController {
    @GetMapping("/job")
    public String getMethodName() {
        return "/client/job/show";
    }
} 
