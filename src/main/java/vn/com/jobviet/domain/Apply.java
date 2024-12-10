package vn.com.jobviet.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tblApply")
public class Apply {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String receiverName;
    private String receiverEmail;
    private String receiverPhone;
    private String mess;
    
    @Column(columnDefinition = "MEDIUMTEXT") 
    private String mess2;

    @Column(columnDefinition = "MEDIUMTEXT") 
    private String feedback;

    private String timeapply;
    private String timefeedback;
    private String status;

    //khoa ngoai
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job;

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getReceiverName() {
        return receiverName;
    }
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }
    public String getReceiverEmail() {
        return receiverEmail;
    }
    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }
    public String getReceiverPhone() {
        return receiverPhone;
    }
    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }
    public String getMess() {
        return mess;
    }
    public void setMess(String mess) {
        this.mess = mess;
    }
    public String getFeedback() {
        return feedback;
    }
    public String getMess2() {
        return mess2;
    }
    public void setMess2(String mess2) {
        this.mess2 = mess2;
    }
    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
    public String getTimeapply() {
        return timeapply;
    }
    public void setTimeapply(String timeapply) {
        this.timeapply = timeapply;
    }
    public String getTimefeedback() {
        return timefeedback;
    }
    public void setTimefeedback(String timefeedback) {
        this.timefeedback = timefeedback;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    
    @Override
    public String toString() {
        return "Apply [id=" + id + ", receiverName=" + receiverName + ", receiverEmail=" + receiverEmail
                + ", receiverPhone=" + receiverPhone + ", mess=" + mess + ", mess2=" + mess2
                + ", feedback=" + feedback + ", timeapply=" + timeapply + ", timefeedback=" + timefeedback + ", status="
                + status + "]";
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Job getJob() {
        return job;
    }
    public void setJob(Job job) {
        this.job = job;
    }

     
}
