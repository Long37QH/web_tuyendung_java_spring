package vn.com.jobviet.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "tblJob")
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String title;
    private String inductry;
    private String jobPosition;
    private String workingForm;
    private String salary;
    private String area;
    private String address;
    private String degree;
    private String yearOld;
    private long quantity;
    private long view;

    @Column(columnDefinition = "MEDIUMTEXT") 
    private String contentjob;
    private String status;
    private String postingtime;
    private String dateline;

    //khoa ngoai
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "job")
    private List<Apply> applys;

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getInductry() {
        return inductry;
    }
    public void setInductry(String inductry) {
        this.inductry = inductry;
    }
    public String getJobPosition() {
        return jobPosition;
    }
    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }
    public String getWorkingForm() {
        return workingForm;
    }
    public void setWorkingForm(String workingForm) {
        this.workingForm = workingForm;
    }
    public String getSalary() {
        return salary;
    }
    public void setSalary(String salary) {
        this.salary = salary;
    }
    public String getArea() {
        return area;
    }
    public void setArea(String area) {
        this.area = area;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getDegree() {
        return degree;
    }
    public void setDegree(String degree) {
        this.degree = degree;
    }
    public String getYearOld() {
        return yearOld;
    }
    public void setYearOld(String yearOld) {
        this.yearOld = yearOld;
    }
    public long getQuantity() {
        return quantity;
    }
    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }
    public long getView() {
        return view;
    }
    public void setView(long view) {
        this.view = view;
    }
    public String getContentjob() {
        return contentjob;
    }
    public void setContentjob(String contentjob) {
        this.contentjob = contentjob;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getPostingtime() {
        return postingtime;
    }
    public void setPostingtime(String postingtime) {
        this.postingtime = postingtime;
    }
    public String getDateline() {
        return dateline;
    }
    public void setDateline(String dateline) {
        this.dateline = dateline;
    }
    
    @Override
    public String toString() {
        return "Job [id=" + id + ", title=" + title + ", inductry=" + inductry + ", jobPosition=" + jobPosition
                + ", workingForm=" + workingForm + ", salary=" + salary + ", area=" + area + ", address=" + address
                + ", degree=" + degree + ", yearOld=" + yearOld + ", quantity=" + quantity + ", view=" + view
                + ", contentjob=" + contentjob + ", status=" + status + ", postingtime=" + postingtime + ", dateline="
                + dateline + "]";
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public List<Apply> getApplys() {
        return applys;
    }
    public void setApplys(List<Apply> applys) {
        this.applys = applys;
    }

    

}
