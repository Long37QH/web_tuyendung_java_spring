package vn.com.jobviet.service;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.JobLike;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.domain.dto.JobCriteriaDTO;
import vn.com.jobviet.repository.JobLikeRepository;
import vn.com.jobviet.repository.JobRepository;
import vn.com.jobviet.service.specification.JobSpecs;

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

    public Page<Job> fetchJobWithSpec(Pageable pageable,JobCriteriaDTO jobCriteriaDTO,String status){
        if(jobCriteriaDTO.getArea() == null
            && jobCriteriaDTO.getWorkingForm() == null
            && jobCriteriaDTO.getSalary() == null
            && jobCriteriaDTO.getExperience() == null
            && jobCriteriaDTO.getInductry() == null){
                return this.jobRepository.findByStatusOrderByViewDesc(status, pageable);
            }
        // Thiết lập `Specification` với điều kiện `status = "Đăng bài"`
        Specification<Job> combinedSpec = Specification.where((root, query, criteriaBuilder) ->
            criteriaBuilder.equal(root.get("status"), "Đăng bài")
        );

        // Áp dụng các tiêu chí từ `JobCriteriaDTO`
        if (jobCriteriaDTO.getInductry() != null && jobCriteriaDTO.getInductry().isPresent()) {
            combinedSpec = combinedSpec.and(JobSpecs.matchListInductry(jobCriteriaDTO.getInductry().get()));
        }
        if (jobCriteriaDTO.getArea() != null && jobCriteriaDTO.getArea().isPresent()) {
            combinedSpec = combinedSpec.and(JobSpecs.matchListArea(jobCriteriaDTO.getArea().get()));
        }
        if (jobCriteriaDTO.getWorkingForm() != null && jobCriteriaDTO.getWorkingForm().isPresent()) {
            combinedSpec = combinedSpec.and(JobSpecs.matchListWorkingForm(jobCriteriaDTO.getWorkingForm().get()));
        }
        if (jobCriteriaDTO.getSalary() != null && jobCriteriaDTO.getSalary().isPresent()) {
            combinedSpec = combinedSpec.and(JobSpecs.matchListSalary(jobCriteriaDTO.getSalary().get()));
        }
        if (jobCriteriaDTO.getExperience() != null && jobCriteriaDTO.getExperience().isPresent()) {
            combinedSpec = combinedSpec.and(JobSpecs.matchListexperience(jobCriteriaDTO.getExperience().get()));
        }

        // Sử dụng phương thức findAll với Specification và sắp xếp theo `view` giảm dần
        return jobRepository.findAll(combinedSpec, PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), Sort.by(Sort.Direction.DESC, "view")));
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
