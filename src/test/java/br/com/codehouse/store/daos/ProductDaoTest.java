package br.com.codehouse.store.daos;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import br.com.codehouse.store.builders.ProductBuilder;
import br.com.codehouse.store.conf.DataSourceConfigurationTest;
import br.com.codehouse.store.conf.JPAConfiguration;
import br.com.codehouse.store.models.PriceType;
import br.com.codehouse.store.models.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={JPAConfiguration.class, ProductDao.class, DataSourceConfigurationTest.class})
@ActiveProfiles("test")
public class ProductDaoTest {
	
	@Autowired
	private ProductDao productDao;

	@Test
	@Transactional
	public void ProductSumPricesByType() {
		
		List<Product> printedBooks = ProductBuilder.newProduct(PriceType.PAPPER, BigDecimal.TEN).more(4).buildAll();
		
		List<Product> eBooks = ProductBuilder.newProduct(PriceType.EBOOK, BigDecimal.TEN).more(9).buildAll();
		
		printedBooks.stream().forEach(productDao::save);
		eBooks.stream().forEach(productDao::save);
		
		BigDecimal value =  productDao.productSumPricesByType(PriceType.PAPPER);
		Assert.assertEquals(new BigDecimal(50).setScale(2), value);
		
		BigDecimal eValue =  productDao.productSumPricesByType(PriceType.EBOOK);
		Assert.assertEquals(new BigDecimal(100).setScale(2), eValue);
	}
	
}
