package vn.com.jobviet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Job;

@Repository
public interface JobRepository extends JpaRepository<Job, Long>{
   
} 