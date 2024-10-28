package vn.com.jobviet.controller.client;


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
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.UploadService;
import vn.com.jobviet.service.UserService;

@Controller
public class RecruitmentController {
    private final UserService userService;
    private final UploadService uploadService;
    public RecruitmentController(UserService userService,UploadService uploadService) {
        this.userService = userService;
        this.uploadService = uploadService;
    }

    @GetMapping("/profile")
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
            RedirectAttributes redirectAttributes
            ) {
        
        //validate
        if (UserBindingResult.hasErrors()) {
            return "/client/home/profile";
        }

        User currenUser = this.userService.getUserById(userUp.getId());
        if (currenUser != null) {
            if(!file.isEmpty()){
                String avatar = this.uploadService.handeSaveUploadFile(file, "avatar");
                currenUser.setAvatar(avatar);
            }
            if(!filelogo.isEmpty()){
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
        return "redirect:/profile";
    }
}
