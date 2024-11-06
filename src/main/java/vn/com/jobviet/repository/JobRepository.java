package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;

@Repository
public interface JobRepository extends JpaRepository<Job, Long> ,JpaSpecificationExecutor<Job>{

   @SuppressWarnings("null")
    List<Job> findAll();

    Job findById(long id);

    List<Job> findByUserAndStatus(User user, String status);

    List<Job> findByStatus(String status);

    Page<Job> findByUserCompanyAndStatus(String company, String status,Pageable pageable);

    @Query("SELECT j FROM Job j WHERE j.status = :status ORDER BY j.view DESC")
    Page<Job> findByStatusOrderByViewDesc(@Param("status") String status, Pageable pageable);


    @Query("SELECT j FROM Job j WHERE j.status = :status AND (:spec IS NULL OR :spec = TRUE)")
    Page<Job> findAllByStatusWithSpec(@Param("status") String status, Specification<Job> spec, Pageable pageable);

    @Query("SELECT j FROM Job j WHERE j.status = :status AND (:spec IS NULL OR :spec = TRUE) ORDER BY j.view DESC")
    Page<Job> findAllByStatusWithSpecOrderByViewDesc(@Param("status") String status, Specification<Job> spec, Pageable pageable);

    @SuppressWarnings("null")
    Page<Job> findAll(Specification<Job> spe,Pageable page);

    long countByStatus(String status);


} 