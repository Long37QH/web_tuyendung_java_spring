package vn.com.jobviet.controller.admin;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import vn.com.jobviet.domain.Plan;
import vn.com.jobviet.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import jakarta.validation.Valid;





@Controller
public class PlanController {
    private final UserService userService;

    public PlanController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/plan")
    public String getPlanPageAdmin(Model model) {
        List<Plan> listPlan = this.userService.getAllPlan();
        model.addAttribute("listPlan", listPlan);
        return "/admin/plan/show";
    }

    @GetMapping("/admin/plan/creat")
    public String getPageCreatPlan(Model model) {
        model.addAttribute("plannew", new Plan());
        return "/admin/plan/creat";
    }

    @PostMapping("/admin/plan/creat")
    public String postCreatPlanNew(Model model,
            @ModelAttribute("plannew") @Valid Plan planNew,
            BindingResult newPlanBindingResult) {
                //validate
            if(newPlanBindingResult.hasErrors()){
                return "/admin/plan/creat";
            }
            System.out.println("run hear : " + planNew);
            this.userService.handSavePlan(planNew);
            return "redirect:/admin/plan";
    }

    @GetMapping("/admin/plan/update/{id}")
    public String getPageUpdarePlan(Model model,@PathVariable long id) {
        Plan plan = this.userService.getPlanById(id);
        model.addAttribute("plan", plan);
        return "/admin/plan/update_plan";
    }

    @PostMapping("/admin/plan/update")
    public String postMethodName(Model model,
    @ModelAttribute("plan") @Valid Plan planUp,
    BindingResult newPlanBindingResult) {

        if(newPlanBindingResult.hasErrors()){
            return "/admin/plan/update_plan";
        }

        Plan curenPlan = this.userService.getPlanById(planUp.getId());
        curenPlan.setName(planUp.getName());
        curenPlan.setPrice(planUp.getPrice());
        curenPlan.setDescription(planUp.getDescription());
        curenPlan.setDetail(planUp.getDetail());

        this.userService.handSavePlan(curenPlan);
        return "redirect:/admin/plan";
    }
    
    @GetMapping("/admin/plan/delete/{id}")
    public String deletePlan(Model model, @PathVariable long id) {
        this.userService.deletePlan(id);
        return "redirect:/admin/plan";
    }
    
}
