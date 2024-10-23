package vn.com.jobviet.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.UploadService;
import vn.com.jobviet.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;








@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;


    public UserController(UserService userService, UploadService uploadService,PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }
    @GetMapping("/admin/user")
    public String getMethodName(Model model) {
        List<User> listUser = this.userService.getAllUsers();
        model.addAttribute("listUser1", listUser);
        return "/admin/user/show";
    }

    @GetMapping("/admin/user/creat")
    public String getCreateUserPage(Model model) {
        model.addAttribute("usernew", new User());
        return "/admin/user/creat";
    }
    
    @PostMapping("/admin/user/creat")
    public String getValueInform(Model model,
            @ModelAttribute("usernew") @Valid User userNew,
            @RequestParam("fileImage") MultipartFile file
            ) {

         // lay thonhg tin file anh
         String avatar = this.uploadService.handeSaveUploadFile(file, "avatar");
         // ma hoa pass
         String hashPassword = this.passwordEncoder.encode(userNew.getPassword());
 
         // cap nhat lai thong tin vao doi tuong usernew
         userNew.setAvatar(avatar);
         userNew.setPassword(hashPassword);
         userNew.setRole(this.userService.getRoleByName(userNew.getRole().getName()));
        userNew.setPlan(this.userService.getPlanById(userNew.getPlan().getId()));        
        System.out.println("run hear : " + userNew);
        this.userService.handlSaveUser(userNew);
        return "redirect:/admin/user";
    }

    // trang user info
    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("check path id >> " + id);
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "/admin/user/user_detail";
    }

    // lay thong tin hien thi trang update
    @GetMapping("/admin/user/update/{id}")
    public String getUpdatePage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "/admin/user/update_user";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateProduct(Model model,
            @ModelAttribute("user") @Valid User userUp,
            @RequestParam("fileImage") MultipartFile file
            ) {

        
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

            currenUser.setRole(this.userService.getRoleByName(userUp.getRole().getName()));

            this.userService.handlSaveUser(currenUser);
            // redirectAttributes.addFlashAttribute("message", "Cập nhật thành công!");
        }

        return "redirect:/admin/user";
    }

    // xóa user
    @GetMapping("/admin/user/delete/{id}")
    public String getDeletePage(Model model, @PathVariable long id) {
        this.userService.deleteUser(id);
        return "redirect:/admin/user";
    }
}
