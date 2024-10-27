package vn.com.jobviet.repository;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Plan;


@Repository
public interface PlanRepository extends JpaRepository<Plan, Long> {
    Plan findById(long id); 
    
    @SuppressWarnings("null")
    List<Plan> findAll();

    @Query("SELECT p FROM Plan p ORDER BY p.level ASC")
    List<Plan> findTop3(Pageable pageable);
}
