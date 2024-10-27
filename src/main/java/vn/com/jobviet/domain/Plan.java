package vn.com.jobviet.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tblPlan")
public class Plan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @Size(min = 2, message = "Tên gói phải có ít nhất 2 ký tự")
    private String name;

    private double price;

    @NotEmpty(message = "Bạn phải nhập phần mô tả cho gói!")
    private String description;

    private long level;

    @NotNull
    @NotEmpty(message = "Không được để trống phần chi tiết gói dịch vụ!")
    @Column(columnDefinition = "MEDIUMTEXT") 
    private String detail;

    //lien ket bang user
    @OneToMany(mappedBy = "plan")
    private List<User> users;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Plan [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", level="
                + level + ", detail=" + detail + "]";
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public long getLevel() {
        return level;
    }

    public void setLevel(long level) {
        this.level = level;
    }

    
    
    
}
