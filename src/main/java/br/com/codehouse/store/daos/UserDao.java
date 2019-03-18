package br.com.codehouse.store.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.codehouse.store.models.User;

@Repository
public class UserDao implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;
	
	public User loadUserByUsername(String email) {
		List<User> users =  manager.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
		.setParameter("email", email)
		.getResultList();
		
		if (users.isEmpty()) {
			throw new UsernameNotFoundException("User not found");
		}
		
		return users.get(0);
	}
	
}
