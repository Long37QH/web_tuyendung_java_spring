package vn.com.jobviet.controller.client;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.com.jobviet.domain.Apply;
import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.JobLike;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.domain.dto.JobCriteriaDTO;
import vn.com.jobviet.service.ApplyService;
import vn.com.jobviet.service.JobService;
import vn.com.jobviet.service.UploadService;
import vn.com.jobviet.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JobPageController {
    private final JobService jobService;
    private final UserService userService;
    private final ApplyService applyService;
    private final UploadService uploadService;

    public JobPageController(JobService jobService, UserService userService,ApplyService applyService,UploadService uploadService) {
        this.jobService = jobService;
        this.userService = userService;
        this.applyService = applyService;
        this.uploadService = uploadService;
    }

    @GetMapping("/job")
    public String getPageJob(Model model, JobCriteriaDTO jobCriteriaDTO,HttpServletRequest request) {
        int page = 1;
        try {
            if (jobCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(jobCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
        }
        PageRequest pageable = PageRequest.of(page - 1, 10);
        String status = "Đăng bài";

        Page<Job> prs = this.jobService.fetchJobWithSpec(pageable, jobCriteriaDTO,status);
        List<Job> listjob = prs.getContent().size() > 0 ? prs.getContent():new ArrayList<Job>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("listjob", listjob);
        // lây so trong hiện tại truyên sang view
        model.addAttribute("curentPage", page);
        // lấy tông số trang
        model.addAttribute("totalPages", prs.getTotalPages());

        model.addAttribute("queryString", qs);
        return "/client/job/show";
    }

    @GetMapping("/job/detail/{id}")
    public String getMethodName(Model model, @PathVariable long id ) {
        Job job = this.jobService.getJobById(id);
        long viewup = job.getView() + 1;
        job.setView(viewup);
        model.addAttribute("job", job);
        model.addAttribute("applyNew", new Apply());
        return "/client/job/detail";
    }

    // xu ly apply
    @PostMapping("/applycv/{id}")
    public String postMethodName(Model model,
            @PathVariable long id,
            @ModelAttribute("applyNew") Apply applynew,
            HttpServletRequest request,
            @RequestParam("fileCV") MultipartFile file,
            RedirectAttributes redirectAttributes) {
        
        HttpSession session = request.getSession(false);
        long id_user = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id_user);
        Job job = this.jobService.getJobById(id);
        
        Apply apply = this.applyService.getApplyByUserAndJob(user, job);
        if (apply == null) {
            if(!file.isEmpty()){
                // lay thonhg tin file cv
                String CV = this.uploadService.handeSaveUploadFileCV(file, "filecv");
                user.setFilecv(CV);
                this.userService.handlSaveUser(user);
            }
            
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String formattedDate = currentTime.format(formatter);

            applynew.setTimeapply(formattedDate);
            applynew.setStatus("Chờ duyệt");
            applynew.setUser(user);
            applynew.setJob(job);

            this.applyService.handSaveApply(applynew);
            redirectAttributes.addFlashAttribute("message", "Bạn đã nôp hồ sơ thành công!");
   
        }else {
            redirectAttributes.addFlashAttribute("message", "Bạn đã ứng tuyển cho việc làm này trước đó!");
        }
        return "redirect:/job";
    }

    @PostMapping("/add-to-joblike/{id}")
    public String postAddJobLike(@PathVariable long id, HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession(false);
        long id_user = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id_user);
        Job job = this.jobService.getJobById(id);

        JobLike jobLike = this.jobService.getJobLikeByUserAndJob(user, job);
        if (jobLike == null) {
            JobLike jobLikeNew = new JobLike();

            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String formattedDate = currentTime.format(formatter);

            jobLikeNew.setTimeLike(formattedDate);
            jobLikeNew.setUser(user);
            jobLikeNew.setJob(job);
            this.jobService.handSaveJobLike(jobLikeNew);
            redirectAttributes.addFlashAttribute("message", "Đã thêm việc làm vào mục việc làm yêu thích của bạn");
        } else {
            redirectAttributes.addFlashAttribute("message", "Việc làm đã tồn trong mục việc làm yêu thích");
        }
        return "redirect:/";
    }

    @PostMapping("/add-to-joblike/job/{id}")
    public String postJobAddJobLike(@PathVariable long id, HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession(false);
        long id_user = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id_user);
        Job job = this.jobService.getJobById(id);

        JobLike jobLike = this.jobService.getJobLikeByUserAndJob(user, job);
        if (jobLike == null) {
            JobLike jobLikeNew = new JobLike();

            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String formattedDate = currentTime.format(formatter);

            jobLikeNew.setTimeLike(formattedDate);
            jobLikeNew.setUser(user);
            jobLikeNew.setJob(job);
            this.jobService.handSaveJobLike(jobLikeNew);
            redirectAttributes.addFlashAttribute("message", "Đã thêm việc làm vào mục việc làm yêu thích của bạn");
        } else {
            redirectAttributes.addFlashAttribute("message", "Việc làm đã tồn trong mục việc làm yêu thích");
        }
        return "redirect:/job";
    }

    @GetMapping("/list-job-like")
    public String getMethodName(Model model,
            @RequestParam("page") Optional<String> pageOptional,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
        }
        PageRequest pageable = PageRequest.of(page - 1, 5);

        HttpSession session = request.getSession(false);
        long idUser = (long) session.getAttribute("id");
        User user = this.userService.getUserById(idUser);

        Page<JobLike> prs = this.jobService.getJobLikeByUser(user, pageable);
        if (prs != null && !prs.isEmpty()) {
            List<JobLike> listjob = prs.getContent();

            model.addAttribute("listjob", listjob);
            // lây so trong hiện tại truyên sang view
            model.addAttribute("curentPage", page);
            // lấy tông số trang
            model.addAttribute("totalPages", prs.getTotalPages());
        } else {
            model.addAttribute("listjob", Collections.emptyList());
            model.addAttribute("curentPage", 1);
            model.addAttribute("totalPages", 1);
        }

        return "/client/job/joblike";
    }

    @GetMapping("/remove-joblike/{id}")
    public String deleteJoblike(Model model, @PathVariable long id, RedirectAttributes redirectAttributes) {
        this.jobService.deleteJoblikeById(id);
        redirectAttributes.addFlashAttribute("message", "Xóa việc làm khỏi mục yêu thích thành công!");
        return "redirect:/list-job-like";
    }

}
