package br.com.codehouse.store.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.codehouse.store.daos.ProductDao;
import br.com.codehouse.store.models.Product;

@Controller
public class HomeController {

	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/")
	@Cacheable(value="productsHome")
	public ModelAndView index() {
		List<Product> products = productDao.list();
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("products", products);
		
		return modelAndView;
	}
	
}
