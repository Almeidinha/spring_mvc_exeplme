package br.com.codehouse.store.controllers;

import java.util.List;

import javax.persistence.NoResultException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.codehouse.store.daos.ProductDao;
import br.com.codehouse.store.infra.FileSaver;
import br.com.codehouse.store.models.PriceType;
import br.com.codehouse.store.models.Product;
import br.com.codehouse.store.validations.ProductValidation;

@Controller
@RequestMapping("/products")
public class ProductsController {
	
	@Autowired
	private ProductDao ProductDao;
	
	@Autowired
	private FileSaver fileSaver;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ProductValidation());
	}

	@RequestMapping("/form")
	public ModelAndView form(Product product) {
		
		ModelAndView modelAndViewnew = new ModelAndView("/products/form");
		modelAndViewnew.addObject("types", PriceType.values());
		
		return modelAndViewnew;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value="productsHome", allEntries = true)
	public ModelAndView save(MultipartFile sumary, @Valid Product product, BindingResult result, RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			return form(product);
		}
		
		String path = fileSaver.write("sumary-files", sumary);		
		product.setSumaryPath(path);
		
		ProductDao.save(product);
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso");
		
		return new ModelAndView("redirect:products");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listProducts() {
		List<Product> products = ProductDao.list();
		ModelAndView modelAndView = new ModelAndView("/products/list");
		modelAndView.addObject("products", products);
		
		return modelAndView;
	}
	
	@RequestMapping("/bookDetails/{id}")
	public ModelAndView detail(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("products/bookDetails");
		
		Product product = ProductDao.find(id);
		modelAndView.addObject("product", product);
		
		return modelAndView;
	}
	
	@RequestMapping("/{id}")
	@ResponseBody
	public Product detailJson(@PathVariable("id") Integer id) {
		
		return ProductDao.find(id);
	}
	
	@ExceptionHandler(NoResultException.class)
	public ModelAndView handleNotFoundException() {
		ModelAndView  modelAndView = new ModelAndView("error");
		modelAndView.addObject("message", "O Produto não foi encontrado!");
		return modelAndView;
	}
	
}
