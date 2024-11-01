package vn.com.jobviet.service;

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

    public Apply handSaveApply(Apply apply){
        Apply applyNew = this.applyRepository.save(apply);
        System.out.println(applyNew);
        return applyNew;
    }
}
