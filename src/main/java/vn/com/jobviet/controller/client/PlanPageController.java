package vn.com.jobviet.controller.client;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.com.jobviet.config.VNPayService;
import vn.com.jobviet.domain.Plan;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.PlanService;
import vn.com.jobviet.service.UserService;

@Controller
public class PlanPageController {

    private final PlanService planService;
    private final UserService userService;
    private final VNPayService vnPayService;
    

    public PlanPageController(PlanService planService,UserService userService,VNPayService vnPayService) {
        this.planService = planService;
        this.userService = userService;
        this.vnPayService = vnPayService;
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

    @PostMapping("/submitOrder")
    public String submidOrder(@RequestParam("id") long id, HttpServletRequest request){
        Plan plan = this.userService.getPlanById(id);

        int orderTotal = (int) plan.getPrice();
        String orderInfo = plan.getName();

        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnPayService.createOrder(orderTotal, orderInfo, baseUrl);
        return "redirect:" + vnpayUrl;
    }

    @GetMapping("/vnpay-payment")
    public String GetMapping(HttpServletRequest request, Model model){
        HttpSession session = request.getSession(false);
        Plan plan = this.planService.getPlanByName(request.getParameter("vnp_OrderInfo"));

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

        int paymentStatus =vnPayService.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);

        return paymentStatus == 1 ? "/client/plan/ordersuccess" : "/client/plan/orderfail";
    }
}