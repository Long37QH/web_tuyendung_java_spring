package vn.com.jobviet.domain.dto;
import java.util.List;
import java.util.Optional;

public class JobCriteriaDTO {
    private Optional<String> page;
    private Optional<List<String>> inductry;
    private Optional<List<String>> area;
    private Optional<List<String>> workingForm;
    private Optional<List<String>> experience;
    private Optional<List<String>> salary;
    
    public Optional<String> getPage() {
        return page;
    }
    public void setPage(Optional<String> page) {
        this.page = page;
    }
    public Optional<List<String>> getInductry() {
        return inductry;
    }
    public void setInductry(Optional<List<String>> inductry) {
        this.inductry = inductry;
    }
    public Optional<List<String>> getArea() {
        return area;
    }
    public void setArea(Optional<List<String>> area) {
        this.area = area;
    }
    public Optional<List<String>> getWorkingForm() {
        return workingForm;
    }
    public void setWorkingForm(Optional<List<String>> workingForm) {
        this.workingForm = workingForm;
    }
    public Optional<List<String>> getExperience() {
        return experience;
    }
    public void setExperience(Optional<List<String>> experience) {
        this.experience = experience;
    }
    public Optional<List<String>> getSalary() {
        return salary;
    }
    public void setSalary(Optional<List<String>> salary) {
        this.salary = salary;
    }

    
}
