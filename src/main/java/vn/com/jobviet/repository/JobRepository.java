package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;

@Repository
public interface JobRepository extends JpaRepository<Job, Long>{

   @SuppressWarnings("null")
    List<Job> findAll();

    Job findById(long id);

    List<Job> findByUserAndStatus(User user, String status);

} 