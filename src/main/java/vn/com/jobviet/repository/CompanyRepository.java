package vn.com.jobviet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Company;

@Repository
public interface CompanyRepository extends JpaRepository<Company, Long> {
    
}
