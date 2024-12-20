package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Role;
import vn.com.jobviet.domain.User;

//crud: create, read, update, delete
@Repository
public interface UserRepository extends JpaRepository<User, Long>{
    
    @SuppressWarnings("null")
    List<User> findAll();
    
    User findById(long id);

    User findByCompany(String company);

    boolean existsByEmail(String email);

    User findByEmail(String email);

    List<User> findByRole(Role role);

    long countByRole_Name(String roleName);

    Page<User> findByRole(Role role,Pageable page);
}
