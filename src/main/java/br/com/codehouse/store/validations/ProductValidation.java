package br.com.codehouse.store.validations;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.codehouse.store.models.Product;

public class ProductValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return Product.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmpty(errors, "title", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "description", "field.required");
		
		Product product = (Product) target;
		if (product.getPages() <= 0) {
			errors.rejectValue("pages", "field.required");
		}
		
	}
	
}
