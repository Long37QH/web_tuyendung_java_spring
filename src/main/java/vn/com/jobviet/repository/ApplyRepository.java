package vn.com.jobviet.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.Apply;
import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.User;

@Repository
public interface ApplyRepository extends JpaRepository<Apply, Long> {

    Apply findByUserAndJob(User user,Job job);

    @SuppressWarnings("null")
    List<Apply> findAll();
    
    List<Apply> findByUser_IdAndStatusOrStatus(Long userId, String status1, String status2);

    Apply findById(long id);

    List<Apply> findByUser_Id(long id);

    // Lấy danh sách các Apply mà job.user.id = userId
    List<Apply> findByJob_User_Id(Long userId);

    // Tìm các Apply theo userId của Job và trạng thái
    List<Apply> findByJob_User_IdAndStatusIn(Long userId, List<String> statuses);

    // Tìm các Apply theo userId của Job và status
    List<Apply> findByJob_User_IdAndStatus(Long userId, String status);

    // Tìm các Apply theo userId của Job và jobId
    List<Apply> findByJob_User_IdAndJob_Id(Long userId, Long jobId);

    // Tìm các Apply theo Job_User_Id và các Status
    @Query("SELECT a FROM Apply a WHERE a.user.id = :userId AND (a.status = :status1 OR a.status = :status2)")
    List<Apply> findByUserIdAndStatuses(@Param("userId") Long userId, 
                                        @Param("status1") String status1, 
                                        @Param("status2") String status2);

}
