package vn.com.jobviet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(String to, String subject, String content) throws MessagingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

        helper.setTo(to); // Email nhận
        helper.setSubject(subject); // Tiêu đề
        helper.setText(content, true); // Nội dung (true để hỗ trợ HTML)
        helper.setFrom("badgun37@gmail.com"); // Email gửi

        mailSender.send(mimeMessage); // Gửi email
    }

}
