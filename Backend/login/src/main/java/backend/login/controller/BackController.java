package backend.login.controller;
import backend.login.Entity.user_info;
import backend.login.Repository.BackendRepository;
import backend.login.Security.SecurityServices;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/login")
public class BackController {
    @Autowired
    BackendRepository repository;
    SecurityServices securityServices = new SecurityServices();

    public BackController() throws Exception {
    }
    @GetMapping("/user")
    ResponseEntity<List<user_info>> getUser() {
        try {
            List<user_info> list = (List<user_info>) repository.findAll();
            if (list == null)
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            for (user_info user : list)
            {
                user.setPassword(securityServices.decrypt(user.getPassword()));
            }
            return ResponseEntity.status(HttpStatus.FOUND).body(list);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @GetMapping("/user/{userId}")
    ResponseEntity<user_info> getUserByID (@PathVariable("userId") int id)
    {
        try {
            user_info user = repository.findById(id).orElse(null);
            if (user == null)
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            user.setPassword(securityServices.decrypt(user.getPassword()));
            return ResponseEntity.status(HttpStatus.FOUND).body(user);
        } catch (Exception e)
        {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    @GetMapping("/user/email/{email}")
    ResponseEntity<user_info> getUserByIdAndPass (@PathVariable("email")String email)
    {
        try {
            user_info user = repository.findUserInfoByEmail(email);
            if (user == null)
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            user.setPassword(securityServices.decrypt(user.getPassword()));
            return ResponseEntity.status(HttpStatus.OK).body(user);
        } catch (Exception e)
        {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PostMapping("/user")
    ResponseEntity<user_info> postData(@RequestBody user_info user) {
        try {
            user.setPassword(securityServices.encrypt(user.getPassword()));
            user_info u = repository.save(user);
            return (u == null) ? ResponseEntity.status(HttpStatus.NOT_FOUND).body(null) : ResponseEntity.status(HttpStatus.OK).body(u);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @DeleteMapping("/user")
    ResponseEntity<String> deleteUser() {
        try {
            repository.deleteAll();
            return ResponseEntity.status(HttpStatus.OK).body("Deleted Successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @DeleteMapping("/user/{id}")
    ResponseEntity<String> deleteUserById(@PathVariable("id") int id) {
        try {
            repository.deleteById(id);
            return ResponseEntity.status(HttpStatus.OK).body("Deleted Successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @DeleteMapping("/user/body")
    ResponseEntity<String> deleteUserByBody(@RequestBody user_info userInfo) {
        try {
            repository.delete(userInfo);
            return ResponseEntity.status(HttpStatus.OK).body("Deleted Successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
