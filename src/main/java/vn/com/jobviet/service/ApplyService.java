package vn.com.jobviet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.com.jobviet.domain.Apply;
import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.repository.ApplyRepository;

@Service
public class ApplyService {
    private final ApplyRepository applyRepository;

    public ApplyService(ApplyRepository applyRepository) {
        this.applyRepository = applyRepository;
    }
    
    public Apply getApplyByUserAndJob(User user,Job job){
        return this.applyRepository.findByUserAndJob(user, job);
    }

    public Apply getApplyById(long id){
        return this.applyRepository.findById(id);
    }

    public Apply handSaveApply(Apply apply){
        Apply applyNew = this.applyRepository.save(apply);
        System.out.println(applyNew);
        return applyNew;
    }

    public List<Apply> getListApplyByUserAndStust(long userId,String status1, String status2){
        return applyRepository.findByUser_IdAndStatusOrStatus(userId, status1, status2);
    }

    public void deleteApplyById(long id){
        this.applyRepository.deleteById(id);
    }

    public List<Apply> getAllApply(){
        return this.applyRepository.findAll();
    }

    public List<Apply> getAllByUserId(long id){
        return this.applyRepository.findByUser_Id(id);
    }

    public List<Apply> getAppliesByUserId(Long userId) {
        return applyRepository.findByJob_User_Id(userId);
    }

    public List<Apply> getAppliesByUserIdAndStatuses2(Long userId, List<String> statuses) {
        return applyRepository.findByJob_User_IdAndStatusIn(userId, statuses);
    }

    public List<Apply> getAppliesByUserIdAndStatus(Long userId, String status) {
        return applyRepository.findByJob_User_IdAndStatus(userId, status);
    }

    public List<Apply> getAppliesByUserIdAndJobId(Long userId, Long jobId) {
        return applyRepository.findByJob_User_IdAndJob_Id(userId, jobId);
    }

    public List<Apply> getAppliesByUserIdAndStatuses(Long userId, String status1, String status2) {
        return applyRepository.findByUserIdAndStatuses(userId, status1, status2);
    }
}
