package vn.com.jobviet.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Apply;
import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;

@Repository
public interface ApplyRepository extends JpaRepository<Apply, Long> {

    Apply findByUserAndJob(User user,Job job);
    
}
