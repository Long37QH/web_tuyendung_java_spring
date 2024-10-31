package vn.com.jobviet.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.service.JobService;



@Controller
public class JobPageController {
    private final JobService jobService;
    
    public JobPageController(JobService jobService) {
        this.jobService = jobService;
    }

    @GetMapping("/job")
    public String getPageJob(Model model,@RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }else{
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
        }
        PageRequest pageable = PageRequest.of(page - 1, 10);
        String status = "Đăng bài";

        Page<Job> prs = this.jobService.GetAllJobByStatusOderbyView(status,pageable);
        List<Job> listjob = prs.getContent();

        model.addAttribute("listjob", listjob);
        //lây so trong hiện tại truyên sang view
        model.addAttribute("curentPage", page);
        // lấy tông số trang
        model.addAttribute("totalPages", prs.getTotalPages());
        return "/client/job/show";
    }

    @GetMapping("/job/detail/{id}")
    public String getMethodName(Model model,@PathVariable long id) {
        Job job = this.jobService.getJobById(id);
        long viewup = job.getView() + 1;
        job.setView(viewup);
        model.addAttribute("job", job);
        return "/client/job/detail";
    }
    
} 
