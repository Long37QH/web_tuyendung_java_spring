package vn.com.jobviet.service;
import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import vn.com.jobviet.domain.Plan;
import vn.com.jobviet.repository.PlanRepository;

@Service
public class PlanService {
    private final PlanRepository planRepository;

    public PlanService(PlanRepository planRepository) {
        this.planRepository = planRepository;
    }

    public List<Plan> getPlanAllTop(){
        return this.planRepository.findTop3(PageRequest.of(0, 3));
    }
    
}
