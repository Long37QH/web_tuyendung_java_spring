package vn.com.jobviet.controller.client;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

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
import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.ApplyService;
import vn.com.jobviet.service.JobService;
import vn.com.jobviet.service.UploadService;
import vn.com.jobviet.service.UserService;

@Controller
public class EmployePageController {
    private final UserService userService;
    private final UploadService uploadService;
    private final JobService jobService;
    private final ApplyService applyService;

    public EmployePageController(UserService userService, UploadService uploadService, JobService jobService,
            ApplyService applyService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.jobService = jobService;
        this.applyService = applyService;
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
            currenUser.setDescLongCompany(userUp.getDescLongCompany());

            this.userService.handlSaveUser(currenUser);
            redirectAttributes.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/tuyendung/profile";
    }

    @GetMapping("/tuyendung/taobaidang")
    public String getPageCreatJob(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        User user = this.userService.getUserById(idUser);
        model.addAttribute("user", user);
        model.addAttribute("jobnew", new Job());
        return "/client/tuyendung/createjob";
    }

    @PostMapping("/tuyendung/taobaidang")
    public String postCreateJob(Model model,
            @ModelAttribute("jobnew") @Valid Job jobnew,
            BindingResult jobBindingResult,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        if (jobBindingResult.hasErrors()) {
            return "/client/tuyendung/createjob";
        }
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        User user = this.userService.getUserById(idUser);

        long numPost = user.getNumPost();
        if (numPost < 1) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Bạn hết số lượt đăng phải nâng cấp gói dịch vụ để tiếp tục dịch vụ.");
            return "redirect:/plan";
        }
        if (numPost >= 1) {
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

    @GetMapping("/tuyendung/baidangchoduyet")
    public String getMethodName(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        User user = this.userService.getUserById(idUser);

        List<Job> listjob = this.jobService.getlistJobByUserAndStatus(user, "Chờ duyệt");
        model.addAttribute("listjob", listjob);
        return "/client/tuyendung/ds_baichoduyet";
    }

    @GetMapping("/tuyendung/suabai/{id}")
    public String getupdateJobtam(Model model, @PathVariable long id) {
        Job job = this.jobService.getJobById(id);
        model.addAttribute("jobup", job);
        return "/client/tuyendung/updatejob";
    }

    @PostMapping("tuyendung/suabai")
    public String postupdateJobtam(Model model,
            @ModelAttribute("jobup") @Valid Job jobup,
            BindingResult jobupBindingResult,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        if (jobupBindingResult.hasErrors()) {
            return "/client/tuyendung/updatejob";
        }
        Job currenJob = this.jobService.getJobById(jobup.getId());
        if (currenJob != null) {
            currenJob.setTitle(jobup.getTitle());
            currenJob.setJobPosition(jobup.getJobPosition());
            currenJob.setInductry(jobup.getInductry());
            currenJob.setQuantity(jobup.getQuantity());
            currenJob.setWorkingForm(jobup.getWorkingForm());
            currenJob.setSalary(jobup.getSalary());
            currenJob.setExperience(jobup.getExperience());
            currenJob.setDegree(jobup.getDegree());
            currenJob.setYearOld(jobup.getYearOld());
            currenJob.setArea(jobup.getArea());
            currenJob.setAddress(jobup.getAddress());
            currenJob.setDateline(jobup.getDateline());
            currenJob.setContentjob(jobup.getContentjob());
            this.jobService.handSaveJob(currenJob);
            redirectAttributes.addFlashAttribute("message", "Cập nhật thành công!");
        }
        return "redirect:/tuyendung/baidangchoduyet";
    }

    // xoa job
    @GetMapping("/tuyendung/xoabai/{id}")
    public String deleteJob(Model model, @PathVariable long id, RedirectAttributes redirectAttributes) {
        this.jobService.deleteJobById(id);
        redirectAttributes.addFlashAttribute("message", "Xóa bài thành công!");
        return "redirect:/tuyendung/baidangchoduyet";
    }

    @GetMapping("/tuyendung/baidangtuyendung")
    public String getPageDsBaiDang(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        User user = this.userService.getUserById(idUser);

        List<Job> listjob = this.jobService.getlistJobByUserAndStatus(user, "Đăng bài");
        model.addAttribute("listjob", listjob);
        return "/client/tuyendung/ds_baidangtuyendung";
    }

    @GetMapping("Tuyendung/dsungvien/{id}")
    public String getApplybyJob(Model model, @PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        List<Apply> applies = applyService.getAppliesByUserIdAndJobId(idUser, id);
        model.addAttribute("applies", applies);
        return "/client/tuyendung/ds_ungvienbyjob";
    }

    @GetMapping("/tuyendung/danhsachungvien")
    public String getAllApply(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        // List<Apply> applies = applyService.getAppliesByUserId(idUser);
        List<String> statuses = Arrays.asList("Đang duyệt", "Chờ duyệt");
        List<Apply> applies = applyService.getAppliesByUserIdAndStatuses2(idUser, statuses);
        model.addAttribute("applies", applies);
        return "/client/tuyendung/ds_hosoungtuyen";
    }

    @GetMapping("/tuyendung/danhsachdaduyet")
    public String getAllApplyFeedback(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        List<String> statuses = Arrays.asList("Đã duyệt", "Từ chối hồ sơ");
        List<Apply> applies = applyService.getAppliesByUserIdAndStatuses2(idUser, statuses);
        model.addAttribute("applies", applies);
        return "/client/tuyendung/ds_ungviendaduyet";
    }

    @GetMapping("/tuyendung/ds_hosoungtuyen/cvdetail")
    public String getMethodName(Model model,
            @RequestParam("userid") Optional<String> useridOptional,
            @RequestParam("jobid") Optional<String> jobidOptional) {
        User userapply = this.userService.getUserById(Long.parseLong(useridOptional.get()));
        Job jobapply = this.jobService.getJobById(Long.parseLong(jobidOptional.get()));
        Apply apply = this.applyService.getApplyByUserAndJob(userapply, jobapply);
        if (apply.getStatus() != "Đã duyệt") {
            apply.setStatus("Đang duyệt");
        }
        this.applyService.handSaveApply(apply);

        model.addAttribute("apply", apply);
        model.addAttribute("userTD", userapply);
        return "/client/tuyendung/cvdetail";
    }

    @GetMapping("/tuyendung/ds_hosoungtuyen/cvdetail2")
    public String getMethodName2(Model model,
            @RequestParam("userid") Optional<String> useridOptional,
            @RequestParam("jobid") Optional<String> jobidOptional) {
        User userapply = this.userService.getUserById(Long.parseLong(useridOptional.get()));
        Job jobapply = this.jobService.getJobById(Long.parseLong(jobidOptional.get()));
        Apply apply = this.applyService.getApplyByUserAndJob(userapply, jobapply);
        
        model.addAttribute("apply", apply);
        model.addAttribute("userTD", userapply);
        return "/client/tuyendung/cvdetail2";
    }

    @PostMapping("/tuyendung/ds_hosoungtuyen/feedback")
    public String postFeedback(Model model, @ModelAttribute("apply") Apply applyup,
            RedirectAttributes redirectAttributes) {
        long id = applyup.getId();
        Apply currenApply = this.applyService.getApplyById(id);
        if (currenApply != null) {
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String formattedDate = currentTime.format(formatter);
            currenApply.setStatus("Đã duyệt");
            currenApply.setTimefeedback(formattedDate);
            currenApply.setFeedback(applyup.getFeedback());

            this.applyService.handSaveApply(currenApply);
            redirectAttributes.addFlashAttribute("message", "Hoàn tất phê duyệt hồ sơ ứng viên!");
        }

        return "redirect:/tuyendung/danhsachungvien";
    }

    @GetMapping("/tuyendung/loaiungvien/{id}")
    public String getMethodName(Model model,HttpServletRequest request, @PathVariable long id, RedirectAttributes redirectAttributes) {

        Apply apply = this.applyService.getApplyById(id);

        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");

        User usertd = this.userService.getUserById(idUser);
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = currentTime.format(formatter);
        apply.setTimefeedback(formattedDate);
        apply.setStatus("Từ chối hồ sơ");
        apply.setFeedback("<h3>Thông Báo Kết Quả Tuyển Dụng Vị Trí "+ apply.getJob().getJobPosition() +"</h3>\r\n" + //
                        " <p><strong>Kính gửi anh/chị "+apply.getReceiverName()+",</strong></p> \r\n" + //
                        "<p> Cảm ơn anh/chị đã quan tâm và ứng tuyển vào vị trí <strong>"+ apply.getJob().getJobPosition() +"</strong> tại <strong>"+usertd.getCompany()+"</strong>. Chúng tôi đã rất ấn tượng với hồ sơ và những kinh nghiệm mà anh/chị đã chia sẻ trong quá trình tuyển dụng. </p> \r\n" + //
                        "<p> Tuy nhiên, sau khi xem xét kỹ lưỡng tất cả các ứng viên, chúng tôi rất tiếc phải thông báo rằng hiện tại chúng tôi đã quyết định lựa chọn một ứng viên khác phù hợp hơn với yêu cầu của vị trí này. </p>\r\n" + //
                        "<p> Quyết định này không hề dễ dàng, bởi anh/chị đã thể hiện rất nhiều tiềm năng và kỹ năng đáng quý. Chúng tôi thực sự đánh giá cao thời gian, nỗ lực và sự quan tâm của anh/chị dành cho <strong>"+usertd.getCompany()+"</strong>. </p> \r\n" + //
                        "<p> Mặc dù lần này kết quả không như mong đợi, chúng tôi hy vọng vẫn có cơ hội hợp tác với anh/chị trong tương lai. Chúng tôi sẽ lưu giữ hồ sơ của anh/chị trong hệ thống và liên hệ nếu có vị trí phù hợp hơn với kỹ năng và định hướng của anh/chị. </p> \r\n" + //
                        "<p> Một lần nữa, xin cảm ơn anh/chị và chúc anh/chị thành công trên con đường sự nghiệp. </p> \r\n" + //
                        "<p>Trân trọng!</p> \r\n" + //
                        "<p>"+usertd.getCompany()+"</p> \r\n" + //
                        "<p>Thông tin liên hệ: email "+usertd.getEmail()+", số điện thoại: "+usertd.getPhone()+"</p>\r\n" + //
                        "");
        this.applyService.handSaveApply(apply);
        redirectAttributes.addFlashAttribute("message", "Đã từ chối ứng viên");
        return "redirect:/tuyendung/danhsachungvien";
    }

}
