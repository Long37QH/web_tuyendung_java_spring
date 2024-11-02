package vn.com.jobviet.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.com.jobviet.domain.Apply;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.ApplyService;
import vn.com.jobviet.service.UploadService;
import vn.com.jobviet.service.UserService;

@Controller
public class CandidatePageController {
    private final UserService userService;
    private final ApplyService applyService;
    private final UploadService uploadService;
    public CandidatePageController(UserService userService, UploadService uploadService,ApplyService applyService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.applyService = applyService;
    }
    @GetMapping("/ungvien/profile")
    public String getPrfileUvPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");

        User user = this.userService.getUserById(idUser);
        model.addAttribute("userpr", user);
        return "/client/ungvien/profile";
    }
    @PostMapping("/update_profileuv")
    public String postUpProfileuv(Model model,
            @ModelAttribute("userpr") @Valid User userUp,
            BindingResult UserBindingResult,
            @RequestParam("fileImage") MultipartFile file,
            RedirectAttributes redirectAttributes
            ) {
        
        //validate
        if (UserBindingResult.hasErrors()) {
            return "/client/ungvien/profile";
        }

        User currenUser = this.userService.getUserById(userUp.getId());
        if (currenUser != null) {
            if(!file.isEmpty()){
                String avatar = this.uploadService.handeSaveUploadFile(file, "avatar");
                currenUser.setAvatar(avatar);
            }
            currenUser.setAddRess(userUp.getAddRess());
            currenUser.setFullName(userUp.getFullName());
            currenUser.setPhone(userUp.getPhone());
            currenUser.setDateOfBirth(userUp.getDateOfBirth());
            
            this.userService.handlSaveUser(currenUser);
            redirectAttributes.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/ungvien/profile";
    }

    @GetMapping("/ungvien/ds_hosoungtuyen")
    public String getPageListApply(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        
        List<Apply> listApplys = this.applyService.getAppliesByUserIdAndStatuses(idUser, "Đang duyệt", "Chờ duyệt");
        model.addAttribute("listApplys", listApplys);
        return "/client/ungvien/ds_hosochoduyet";
    }

    @GetMapping("/ungvien/kequaungtuyen")
    public String getPageketqua(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
       
        List<Apply> listApplys = this.applyService.getAppliesByUserIdAndStatuses(idUser, "Đã duyệt", "Từ chối hồ sơ");
        model.addAttribute("listApplys", listApplys);
        return "/client/ungvien/ketquaungtuyen";
    }
    
    @GetMapping("/ungvien/ketqua/{id}")
    public String getketqua(Model model, @PathVariable long id) {
        Apply apply = this.applyService.getApplyById(id);
        model.addAttribute("apply", apply);
        return "/client/ungvien/ketquadetail";
    }

    //huy ung tuyen
    @GetMapping("/ungvien/huyungtuyen/{id}")
    public String getMethodName(Model model, @PathVariable long id, RedirectAttributes redirectAttributes) {
        this.applyService.deleteApplyById(id);
        redirectAttributes.addFlashAttribute("message", "Hủy ứng tuyển thành công!");
        return "redirect:/ungvien/ds_hosoungtuyen";
    }
        
    
}
