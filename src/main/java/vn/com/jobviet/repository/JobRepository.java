package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;

@Repository
public interface JobRepository extends JpaRepository<Job, Long>{

   @SuppressWarnings("null")
    List<Job> findAll();

    Job findById(long id);

    List<Job> findByUserAndStatus(User user, String status);

    List<Job> findByStatus(String status);

    @Query("SELECT j FROM Job j WHERE j.status = :status ORDER BY j.view DESC")
    Page<Job> findByStatusOrderByViewDesc(@Param("status") String status, Pageable pageable);

} 