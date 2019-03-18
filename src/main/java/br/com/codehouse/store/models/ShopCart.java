package br.com.codehouse.store.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component // Not a controller or a dao but needs to be injected by Spring
@Scope(value=WebApplicationContext.SCOPE_SESSION, proxyMode=ScopedProxyMode.TARGET_CLASS)
public class ShopCart implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<CartItem, Integer> itens = new LinkedHashMap<CartItem, Integer>();
	
	public void add(CartItem cartItem) {		
		itens.put(cartItem, getAmount(cartItem) + 1);
	}

	public int getAmount(CartItem cartItem) {
		if (!itens.containsKey(cartItem)) {
			itens.put(cartItem, 0);
		}
		return itens.get(cartItem);
	}
	
	public int getAmount() {
		return itens.values().stream().reduce(0, (a, b) -> a + b);
	}

	public Collection<CartItem> getItens() {
		return itens.keySet();
	}

	public BigDecimal getTotal(CartItem cartItem) {
		return cartItem.getTotal(getAmount(cartItem));
	}
	
	public BigDecimal getTotal() {
		BigDecimal total = BigDecimal.ZERO;
		
		for (CartItem item : itens.keySet()) {
			total = total.add(getTotal(item));
		}
		
		return total;
	}

	public void remove(Integer productId, PriceType priceType) {
		Product product = new Product();
		product.setId(productId);
		itens.remove(new CartItem(product, priceType));
		
	}
	
	
	
}
