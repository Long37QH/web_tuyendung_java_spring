package vn.com.jobviet.service;

import org.springframework.stereotype.Service;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.repository.JobRepository;

@Service
public class JobService {
    private final JobRepository jobRepository;

    public JobService(JobRepository jobRepository) {
        this.jobRepository = jobRepository;
    }
    
    public Job handSaveJob(Job job){
        Job jobnew = this.jobRepository.save(job);
        System.out.println(jobnew);
        return jobnew;
    }
}
