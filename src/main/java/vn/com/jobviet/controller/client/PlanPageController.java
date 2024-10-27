package vn.com.jobviet.controller.client;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.com.jobviet.domain.Plan;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.PlanService;
import vn.com.jobviet.service.UserService;

@Controller
public class PlanPageController {

    private final PlanService planService;
    private final UserService userService;
    

    public PlanPageController(PlanService planService,UserService userService) {
        this.planService = planService;
        this.userService = userService;
    }


    @GetMapping("/plan")
    public String getPlanPage(Model model) {
        List<Plan> listplans = this.planService.getPlanAllTop();
        model.addAttribute("listplans", listplans);
        return "/client/plan/show";
    }
    @PostMapping("/package-registration/{id}")
    public String postMethodName(@PathVariable long id, HttpServletRequest request,RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession(false);
        Plan plan = this.userService.getPlanById(id);
        long numPost = 1;
        if(plan.getLevel() == 1){
            numPost = 5;
        }
        if(plan.getLevel() == 2){
            numPost = 10;
        }
        if(plan.getLevel() == 3){
            numPost = 20;
        }

        long idUser = (long) session.getAttribute("id");

        User user = this.userService.getUserById(idUser);
        user.setPlan(plan);
        user.setNumPost(numPost);

        this.userService.handlSaveUser(user);
        redirectAttributes.addFlashAttribute("message", "Đăng ký gói dịch vụ thành công!");
        return "redirect:/plan";
    }
}
