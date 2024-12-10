package vn.com.jobviet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.com.jobviet.domain.OderPlan;

@Repository
public interface OderPlanRepository extends JpaRepository<OderPlan,Long> {
    @SuppressWarnings("null")
    public List<OderPlan> findAll();

    @Query(value = "SELECT SUM(total_price) FROM tbl_order_plan", nativeQuery = true)
    Double TotalPrice();

    // láy list theo ngày
    @Query(value = "SELECT * FROM tbl_order_plan WHERE STR_TO_DATE(time_order, '%d/%m/%Y') BETWEEN :startDate AND :endDate ORDER BY STR_TO_DATE(time_order, '%d/%m/%Y') ASC", nativeQuery = true)
    List<OderPlan> findOrdersWithinDateRange(@Param("startDate") String startDate, @Param("endDate") String endDate);

    // query tính tổng tiền trong một khoảng thời gian
    @Query(value = "SELECT SUM(total_price) FROM tbl_order_plan WHERE STR_TO_DATE(time_order, '%d/%m/%Y') BETWEEN :startDate AND :endDate", nativeQuery = true)
    Double TotalPriceBetweenDates(String startDate, String endDate);
}
