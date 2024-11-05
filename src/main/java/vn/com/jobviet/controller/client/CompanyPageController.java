package vn.com.jobviet.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.jobviet.domain.Role;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.UserService;



@Controller
public class CompanyPageController {

    private final UserService userService;

    public CompanyPageController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/company")
    public String getCompanyPage(Model model,@RequestParam("page") Optional<String> pageOptional) {
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
        PageRequest pageable = PageRequest.of(page - 1, 6);

        Role role = this.userService.getRoleByName("USER1");
        Page<User> prs =  this.userService.getUserByRole(role, pageable);
        List<User> listcompany = prs.getContent();

        model.addAttribute("listcompany", listcompany);
        //lây so trong hiện tại truyên sang view
        model.addAttribute("curentPage", page);
        // lấy tông số trang
        model.addAttribute("totalPages", prs.getTotalPages());
        return "/client/company/show";
    }
    
}
