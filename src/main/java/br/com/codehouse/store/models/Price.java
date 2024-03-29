package br.com.codehouse.store.models;

import java.math.BigDecimal;

import javax.persistence.Embeddable;

@Embeddable
public class Price {
	
	private BigDecimal value;
	private PriceType type;
	
	
	public BigDecimal getValue() {
		return value;
	}
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	public PriceType getType() {
		return type;
	}
	public void setType(PriceType type) {
		this.type = type;
	}
	
	
	@Override
	public String toString() {
		return "Price [value=" + value + ", type=" + type + "]";
	}
	
	
	
}
