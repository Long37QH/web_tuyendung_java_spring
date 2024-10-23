package vn.com.jobviet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Plan;


@Repository
public interface PlanRepository extends JpaRepository<Plan, Long> {
    Plan findById(long id);  
}
