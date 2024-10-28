package vn.com.jobviet.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name = "tblUser")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @Email
    @Email(message = "Email không hợp lệ!", regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
    @NotEmpty(message = "Không được để trống thông tin này!")
    private String email;

    @Size(min = 3, message = "Tên phải có ít nhất 3 ký tự")
    private String password;

    @NotNull
    @Size(min = 2, message = "Tên phải có ít nhất 2 ký tự")
    private String fullName;
    private String addRess;
    private String phone;
    private String avatar;
    private String dateOfBirth;
    private long numPost;
    private String company;
    private String descCompany;
    private String logoCompany;

    // khai bao khoa ngoai
    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    @ManyToOne
    @JoinColumn(name = "plan_id")
    private Plan plan;

    @OneToMany(mappedBy = "user")
    private List<Job> jobs;

    @OneToMany(mappedBy = "user")
    private List<Apply> applys;

    

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getAddRess() {
        return addRess;
    }
    public void setAddRess(String addRess) {
        this.addRess = addRess;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAvatar() {
        return avatar;
    }
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public String getDateOfBirth() {
        return dateOfBirth;
    }
    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
   
    @Override
    public String toString() {
        return "User [id=" + id + ", email=" + email + ", password=" + password + ", fullName=" + fullName
                + ", addRess=" + addRess + ", phone=" + phone + ", avatar=" + avatar + ", dateOfBirth=" + dateOfBirth
                + ", numPost=" + numPost + "]";
    }

    public Role getRole() {
        return role;
    }
    public void setRole(Role role) {
        this.role = role;
    }
    public Plan getPlan() {
        return plan;
    }
    public void setPlan(Plan plan) {
        this.plan = plan;
    }
    public List<Job> getJobs() {
        return jobs;
    }
    public void setJobs(List<Job> jobs) {
        this.jobs = jobs;
    }
    public List<Apply> getApplys() {
        return applys;
    }
    public void setApplys(List<Apply> applys) {
        this.applys = applys;
    }
    public long getNumPost() {
        return numPost;
    }
    public void setNumPost(long numPost) {
        this.numPost = numPost;
    }

    public String getCompany() {
        return company;
    }
    public void setCompany(String company) {
        this.company = company;
    }
    public String getDescCompany() {
        return descCompany;
    }
    public void setDescCompany(String descCompany) {
        this.descCompany = descCompany;
    }
    public String getLogoCompany() {
        return logoCompany;
    }
    public void setLogoCompany(String logoCompany) {
        this.logoCompany = logoCompany;
    }

    

}
