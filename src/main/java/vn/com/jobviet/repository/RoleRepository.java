package vn.com.jobviet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>{
    // lay doi tuong role theo name
    Role findByName(String name);  
}
