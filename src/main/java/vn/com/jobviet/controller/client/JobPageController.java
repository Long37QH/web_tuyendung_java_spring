package vn.com.jobviet.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.service.JobService;



@Controller
public class JobPageController {
    private final JobService jobService;
    
    public JobPageController(JobService jobService) {
        this.jobService = jobService;
    }

    @GetMapping("/job")
    public String getPageJob() {
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
