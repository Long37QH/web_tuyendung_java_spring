package vn.com.jobviet.service;
import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import vn.com.jobviet.domain.OderPlan;
import vn.com.jobviet.domain.Plan;
import vn.com.jobviet.repository.OderPlanRepository;
import vn.com.jobviet.repository.PlanRepository;

@Service
public class PlanService {
    private final PlanRepository planRepository;
    private final OderPlanRepository oderPlanRepository;

    public PlanService(PlanRepository planRepository,OderPlanRepository oderPlanRepository) {
        this.planRepository = planRepository;
        this.oderPlanRepository = oderPlanRepository;
    }

    public List<Plan> getPlanAllTop(){
        return this.planRepository.findTop3(PageRequest.of(0, 3));
    }

    public Plan getPlanByName(String name){
        return this.planRepository.findByName(name);
    }

    public OderPlan handSaveOderPlan(OderPlan oderPlan){
        OderPlan oderPlanNew = this.oderPlanRepository.save(oderPlan);
        System.out.println(oderPlanNew);
        return oderPlanNew;
    }

    public List<OderPlan> getOrderPhan(){
        return this.oderPlanRepository.findAll();
    }
}
