package br.com.codehouse.store.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.codehouse.store.daos.ProductDao;
import br.com.codehouse.store.models.CartItem;
import br.com.codehouse.store.models.PriceType;
import br.com.codehouse.store.models.Product;
import br.com.codehouse.store.models.ShopCart;

@Controller
@RequestMapping("/shopCart")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class ShopCartController {

	@Autowired
	private ProductDao productdao;
	@Autowired
	private ShopCart shopCart;

	@RequestMapping("/add")
	public ModelAndView add(Integer productId, PriceType priceType) {
		ModelAndView modelAndView = new ModelAndView("redirect:/shopCart");
		
		CartItem cartItem = createIten(productId, priceType);
		shopCart.add(cartItem);
		
		return modelAndView;
		
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView itens() {
		return new ModelAndView("shopCart/CartItens");
	}
	
	private CartItem createIten(Integer productId, PriceType priceType) {
		Product product = productdao.find(productId);
		CartItem cartItem = new CartItem(product, priceType);
		return cartItem;
	}
	
	@RequestMapping("/remove")
	public ModelAndView remove(Integer productId, PriceType priceType) {
		
		shopCart.remove(productId, priceType);
		return new ModelAndView("redirect:/shopCart");
	}
			
	
}
