package br.com.codehouse.store.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.codehouse.store.models.PriceType;
import br.com.codehouse.store.models.Product;

@Repository
@Transactional
public class ProductDao {
	
	@PersistenceContext
	private EntityManager manager;

	public void save(Product product) {
		
		manager.persist(product);
		
	}

	public List<Product> list() {
		return manager.createQuery("SELECT DISTINCT(p) FROM Product p JOIN FETCH p.prices", Product.class)
				.getResultList();
	}

	public Product find(Integer id) {
		return manager.createQuery("SELECT DISTINCT(p) FROM Product p " + 
				"JOIN FETCH p.prices price WHERE p.id = :id", Product.class).setParameter("id", id)
				.getSingleResult(); // find(Product.class, id);
	}
	
	public BigDecimal productSumPricesByType(PriceType priceType) {
		TypedQuery<BigDecimal> query = manager
				.createQuery("SELECT SUM(price.value) FROM Product p "
				+ "JOIN p.prices price WHERE price.type = :priceType", BigDecimal.class);

		query.setParameter("priceType", priceType);
		return query.getSingleResult();
	}

}
