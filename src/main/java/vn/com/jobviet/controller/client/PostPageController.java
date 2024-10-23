package vn.com.jobviet.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PostPageController {
    @GetMapping("/post")
    public String getMethodName() {
        return "/client/post/show";
    }
}
