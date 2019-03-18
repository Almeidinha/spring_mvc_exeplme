package br.com.codehouse.store.builders;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.codehouse.store.models.Price;
import br.com.codehouse.store.models.Product;
import br.com.codehouse.store.models.PriceType;;

public class ProductBuilder {

    private List<Product> products = new ArrayList<>();

    private ProductBuilder(Product product) {
    	products.add(product);

    }

    public static ProductBuilder newProduct(PriceType priceType, BigDecimal value) {
        Product book = create("book 1", priceType, value);
        return new ProductBuilder(book);
    }

    public static ProductBuilder newProduct() {
        Product book = create("livro 1", PriceType.COMBO, BigDecimal.TEN);
        return new ProductBuilder(book);
    }

    private static Product create(String nomeLivro, PriceType priceType, BigDecimal value) {
    	Product book = new Product();
    	book.setTitle(nomeLivro);
    	book.setReleaseDate(Calendar.getInstance());
    	book.setPages(150);
    	book.setDescription("Livro top sobre testes");
    	Price price = new Price();
    	price.setType(priceType);
    	price.setValue(value);
    	book.getPrices().add(price);
        return book;
    }

    public ProductBuilder more(int number) {
        Product base = products.get(0);
        Price preco = base.getPrices().get(0);
        for (int i = 0; i < number; i++) {
        	products.add(create("Book " + i, preco.getType(), preco.getValue()));
        }
        return this;
    }

    public Product buildOne() {
        return products.get(0);
    }

    public List<Product> buildAll() {
        return products;
    }
}