package vn.com.jobviet.config;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.service.UserService;

public class CustomSuccessHandler implements AuthenticationSuccessHandler{

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Autowired
    private  UserService userService;

    protected String determineTargetUrl(final Authentication authentication) {

        Map<String, String> roleTargetUrlMap = new HashMap<>();

        // xác định dường dân trả về theo role

        roleTargetUrlMap.put("ROLE_USER1", "/");
        roleTargetUrlMap.put("ROLE_USER2", "/");
        // roleTargetUrlMap.put("ROLE_USER1", "/product/1");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        throw new IllegalStateException();
    }
    
    protected void clearAuthenticationAttributes(HttpServletRequest request,Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        
        //get email từ security
        String email = authentication.getName();

        //lay thong tin user truyên cho session
        User user = this.userService.getUserByEmail(email);
        if(user != null){
            session.setAttribute("fullname", user.getFullName());
            session.setAttribute("avatar", user.getAvatar());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("roleUser", user.getRole().getName());

        //     // lay so luong san pham gans cho session
        //     int sumsp = user.getCart() == null ? 0 : user.getCart().getSum();
        //     session.setAttribute("sumsp", sumsp);
        }
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
                String targetUrl = determineTargetUrl(authentication);

                if (response.isCommitted()) {
                    return;
                }
        
                redirectStrategy.sendRedirect(request, response, targetUrl);  
                clearAuthenticationAttributes(request,authentication);
    }
    
}
