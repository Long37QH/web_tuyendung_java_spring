package vn.com.jobviet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Apply;

@Repository
public interface ApplyRepository extends JpaRepository<Apply, Long> {
    
}
