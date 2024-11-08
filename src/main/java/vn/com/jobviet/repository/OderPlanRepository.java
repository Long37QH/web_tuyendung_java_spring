package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.OderPlan;

@Repository
public interface OderPlanRepository extends JpaRepository<OderPlan,Long> {
    @SuppressWarnings("null")
    public List<OderPlan> findAll();
}
