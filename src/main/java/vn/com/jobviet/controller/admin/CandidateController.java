package vn.com.jobviet.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.jobviet.domain.Apply;
import vn.com.jobviet.domain.Role;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.ApplyService;
import vn.com.jobviet.service.UserService;

@Controller
public class CandidateController {
    private final UserService userService;
    private final ApplyService applyService;

    public CandidateController(UserService userService,ApplyService applyService) {
        this.userService = userService;
        this.applyService = applyService;
    }
    
    @GetMapping("/admin/ungvien")
    public String getPageAdminTuyendung(Model model) {
        Role role = this.userService.getRoleByName("USER2");
        List<User> listUser = this.userService.getListUserByRole(role);
        model.addAttribute("listUser", listUser);
        return "/admin/ungvien/listtk_ungvien";
    }

    @GetMapping("/admin/ungvien/{id}")
    public String getInfoTuyendung(Model model,@PathVariable long id) {
        List <Apply> listApplies =  this.applyService.getAllByUserId(id);
        model.addAttribute("listApplies", listApplies);
        return "/admin/ungvien/vieclamungtuyen";
    }
    
    @GetMapping("/admin/applycv")
    public String getAdminpageApply(Model model) {
        List <Apply> listApplies = this.applyService.getAllApply();
        model.addAttribute("listApplies", listApplies);
        return "/admin/ungvien/ds_apply";
    }

    @GetMapping("/admin/xoaapply/{id}")
    public String getMethodName(Model model, @PathVariable long id, RedirectAttributes redirectAttributes) {
        this.applyService.deleteApplyById(id);
        return "redirect:/admin/applycv";
    }
}
