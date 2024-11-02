package vn.com.jobviet.service;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.JobLike;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.repository.JobLikeRepository;
import vn.com.jobviet.repository.JobRepository;

@Service
public class JobService {
    private final JobRepository jobRepository;
    private final JobLikeRepository jobLikeRepository;

    public JobService(JobRepository jobRepository,JobLikeRepository jobLikeRepository) {
        this.jobRepository = jobRepository;
        this.jobLikeRepository = jobLikeRepository;
    }
    
    public Job handSaveJob(Job job){
        Job jobnew = this.jobRepository.save(job);
        System.out.println(jobnew);
        return jobnew;
    }

    public List<Job> getlistJobByUserAndStatus(User user, String status){
        return this.jobRepository.findByUserAndStatus(user, status);
    } 

    public Job getJobById(long id){
        return this.jobRepository.findById(id);
    }

    public void deleteJobById(long id){
        this.jobRepository.deleteById(id);
    }

    public List<Job> getListJobByStatus(String status){
        return this.jobRepository.findByStatus(status);
    }

    //lay listjob trang home
    public Page<Job>GetAllJobByStatusOderbyView(String status,Pageable pageable){
        return this.jobRepository.findByStatusOrderByViewDesc(status, pageable);
    }

    public Page<JobLike> getJobLikeByUser(User user,Pageable pageable){
        return this.jobLikeRepository.findByUser(user, pageable);
    }

    public JobLike getJobLikeByUserAndJob(User user, Job job){
        return this.jobLikeRepository.findByUserAndJob(user, job);
    }

    public JobLike handSaveJobLike(JobLike joblikenew){
        JobLike jobLike = this.jobLikeRepository.save(joblikenew);
        System.out.println(jobLike);
        return jobLike;
    }

    public void deleteJoblikeById(long id){
        this.jobLikeRepository.deleteById(id);
    }

    public long countJobsWithStatus(String status) {
        return jobRepository.countByStatus(status);
    }
}
