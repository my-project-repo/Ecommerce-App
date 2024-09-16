package backend.login.Repository;

import backend.login.Entity.user_info;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

@Component
public interface BackendRepository extends JpaRepository<user_info,Integer> {
    @Query("select u from user_info u WHERE u.email =:x")
    user_info findUserInfoByEmail (@Param("x") String email);
    @Query("select u from user_info u WHERE u.password =:u")
    user_info findUserByPassword (@Param("u") String password);
    @Query("select u from user_info u WHERE u.email =:x and u.password =:y")
    user_info findUserByEmailAndPassword (@Param("x") String email , @Param("y") String password);
}
