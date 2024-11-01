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
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "tblJob")
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Trường thông tin không được để trống!")
    private String title; //tieu đề 1

    private String inductry; // ngành 3

    @NotEmpty(message = "Trường thông tin không được để trống!")
    private String jobPosition; //vị trí tuyển dụng 2
    private String workingForm; //hinh thưc 5
    private String salary; // lương 6
    private String experience; //kinh nghiệm 7
    private String area; // khu vực 10

    @NotEmpty(message = "Trường thông tin không được để trống!")
    private String address; // địa chỉ 11
    private String degree; // bằng cấp 8

    @NotEmpty(message = "Trường thông tin không được để trống!")
    private String yearOld; // tuôi 9

    @Min(value = 1 , message = "Số lương tuyển dụng phải lớn hơn 0!")
    private long quantity; // số lượng 4
    
    private long view; // so luong truy cap 

    @Column(columnDefinition = "MEDIUMTEXT") 
    @NotEmpty(message = "Trường thông tin không được để trống!")
    private String contentjob; // moi dung mô tả 13
    private String status; // trang thái bài
    private String postingtime; // thời gian đăng

    @NotEmpty(message = "Trường thông tin không được để trống!")
    private String dateline; // han tuyen dụng 12

    //khoa ngoai
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "job")
    private List<Apply> applys;

    @OneToMany(mappedBy = "job")
    private List<JobLike> jobLikes;

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
    public String getExperience() {
        return experience;
    }
    public void setExperience(String experience) {
        this.experience = experience;
    }
    public List<JobLike> getJobLikes() {
        return jobLikes;
    }
    public void setJobLikes(List<JobLike> jobLikes) {
        this.jobLikes = jobLikes;
    }

}
