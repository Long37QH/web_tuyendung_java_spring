package vn.com.jobviet.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.com.jobviet.domain.Job;
import vn.com.jobviet.domain.Job_;

public class JobSpecs {
    public static Specification<Job> TitleLike(String title){
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Job_.TITLE),"%" + title + "%");
    }

    // lấy theo ngành
    public static Specification<Job> matchListInductry(List<String> inductry) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Job_.INDUCTRY)).value(inductry);
    }
    // khu vục
    public static Specification<Job> matchListArea(List<String> area) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Job_.AREA)).value(area);
    }

    // Hình thức
    public static Specification<Job> matchListWorkingForm(List<String> workingForm) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Job_.WORKING_FORM)).value(workingForm);
    }

    // luong
    public static Specification<Job> matchListSalary(List<String> salary) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Job_.SALARY)).value(salary);
    }

    // kinh nghiệm
    public static Specification<Job> matchListexperience(List<String> experience) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Job_.EXPERIENCE)).value(experience);
    }

}
