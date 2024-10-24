package vn.com.jobviet.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tblPost")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Không được để trống tiêu đề bài viết!")
    private String title;
    
    @NotNull
    @Size(min = 2, message = "Phần mô tả phải nhiều hơn 2 ký tự!")
    private String shortdesc;

    @NotEmpty(message = "Không được để trống nội dung bài viết!")
    @Column(columnDefinition = "MEDIUMTEXT") 
    private String content;

    private String image;

    @NotEmpty(message = "Không được để trống tên tác giả!")
    private String author;
    private String timeposting;
    private long view;
    private String status;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

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

    public String getShortdesc() {
        return shortdesc;
    }
    public void setShortdesc(String shortdesc) {
        this.shortdesc = shortdesc;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getTimeposting() {
        return timeposting;
    }
    public void setTimeposting(String timeposting) {
        this.timeposting = timeposting;
    }
    public long getView() {
        return view;
    }
    public void setView(long view) {
        this.view = view;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    @Override
    public String toString() {
        return "Post [id=" + id + ", title=" + title + ", shortdesc=" + shortdesc
                + ", content=" + content + ", image=" + image + ", author=" + author + ", timeposting=" + timeposting
                + ", view=" + view + ", status=" + status + "]";
    }
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }

    
}
