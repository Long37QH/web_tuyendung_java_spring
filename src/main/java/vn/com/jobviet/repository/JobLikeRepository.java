package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.JobLike;
import vn.com.jobviet.domain.User;

@Repository
public interface JobLikeRepository extends JpaRepository<JobLike,Long> {
    List<JobLike> findByUser(User user);
    
    JobLike findByUserAndJob(User user,Job job);

    Page<JobLike> findByUser(User user,Pageable pageable);
}
