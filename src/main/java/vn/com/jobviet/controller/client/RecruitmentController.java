package vn.com.jobviet.controller.client;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.JobService;
import vn.com.jobviet.service.UploadService;
import vn.com.jobviet.service.UserService;

@Controller
public class RecruitmentController {
    private final UserService userService;
    private final UploadService uploadService;
    private final JobService jobService;

    public RecruitmentController(UserService userService, UploadService uploadService, JobService jobService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.jobService = jobService;
    }

    @GetMapping("/tuyendung/profile")
    public String getPrfiletvPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");

        User user = this.userService.getUserById(idUser);
        model.addAttribute("userTD", user);

        return "/client/tuyendung/profile";
    }

    @PostMapping("/update_profileTD")
    public String postUpProfile(Model model,
            @ModelAttribute("userTD") @Valid User userUp,
            BindingResult UserBindingResult,
            @RequestParam("fileImage") MultipartFile file,
            @RequestParam("fileImagelogo") MultipartFile filelogo,
            RedirectAttributes redirectAttributes) {

        // validate
        if (UserBindingResult.hasErrors()) {
            return "/client/tuyendung/profile";
        }

        User currenUser = this.userService.getUserById(userUp.getId());
        if (currenUser != null) {
            if (!file.isEmpty()) {
                String avatar = this.uploadService.handeSaveUploadFile(file, "avatar");
                currenUser.setAvatar(avatar);
            }
            if (!filelogo.isEmpty()) {
                String logo = this.uploadService.handeSaveUploadFile(filelogo, "company");
                currenUser.setLogoCompany(logo);
            }
            currenUser.setAddRess(userUp.getAddRess());
            currenUser.setFullName(userUp.getFullName());
            currenUser.setPhone(userUp.getPhone());
            currenUser.setDateOfBirth(userUp.getDateOfBirth());
            currenUser.setCompany(userUp.getCompany());
            currenUser.setDescCompany(userUp.getDescCompany());

            this.userService.handlSaveUser(currenUser);
            redirectAttributes.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/tuyendung/profile";
    }

    @GetMapping("/tuyendung/taobaidang")
    public String getPageCreatJob(Model model) {
        model.addAttribute("jobnew", new Job());
        return "/client/tuyendung/createjob";
    }

    @PostMapping("/tuyendung/taobaidang")
    public String postCreateJob(Model model,
            @ModelAttribute("jobnew") @Valid Job jobnew,
            BindingResult jobBindingResult,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        if(jobBindingResult.hasErrors()){
            return "/client/tuyendung/createjob";
        }
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        User user = this.userService.getUserById(idUser);
        
        long numPost = user.getNumPost();
        if(numPost < 1){
            redirectAttributes.addFlashAttribute("errorMessage", "Bạn hết số lượt đăng phải nâng cấp gói dịch vụ để tiếp tục dịch vụ.");
            return "redirect:/plan"; 
        }
        if(numPost >= 1){
            numPost = numPost - 1;
        }
        user.setNumPost(numPost);
        this.userService.handlSaveUser(user);
        // format thoi dan dateline
        String dateStr = jobnew.getDateline();
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate date = LocalDate.parse(dateStr, inputFormatter);
        String dateline = date.format(outputFormatter);
        // lấy thời gian
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = currentTime.format(formatter);

        jobnew.setStatus("Chờ duyệt");
        jobnew.setView(1);
        jobnew.setPostingtime(formattedDate);
        jobnew.setDateline(dateline);
        jobnew.setUser(user);
        this.jobService.handSaveJob(jobnew);
        redirectAttributes.addFlashAttribute("message", "Tạo bài tuyển dụng thành công!");
        return "redirect:/tuyendung/taobaidang";
    }

}
