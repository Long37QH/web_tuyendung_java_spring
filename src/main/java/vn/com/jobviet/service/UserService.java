package vn.com.jobviet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.com.jobviet.domain.Plan;
import vn.com.jobviet.domain.Role;
import vn.com.jobviet.domain.User;
import vn.com.jobviet.repository.PlanRepository;
import vn.com.jobviet.repository.RoleRepository;
import vn.com.jobviet.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PlanRepository planRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository,PlanRepository planRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.planRepository = planRepository;
    }

    public List<User> getAllUsers(){
        return this.userRepository.findAll();
    }

    public User getUserById(long id){
        return this.userRepository.findById(id);
    }

    public Role getRoleByName(String name){
        return this.roleRepository.findByName(name);
    }

    public Plan getPlanById(long id){
        return this.planRepository.findById(id);
    }

    public List<Plan> getAllPlan(){
        return this.planRepository.findAll();
    }


    public User handlSaveUser(User user){
        User usernew = this.userRepository.save(user);
        System.out.println(usernew);
        return usernew ;
    }

    public Plan handSavePlan(Plan plan){
        Plan plannew = this.planRepository.save(plan);
        System.out.println(plannew);
        return plannew;
    }

    public void deleteUser(long id){
        this.userRepository.deleteById(id);
    }

    public void deletePlan(long id){
        this.planRepository.deleteById(id);
    }
    
}
