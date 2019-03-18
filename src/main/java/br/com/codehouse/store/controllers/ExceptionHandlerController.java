package br.com.codehouse.store.controllers;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandlerController {

	@ExceptionHandler(Exception.class)
	public ModelAndView handleGenericException(Exception e) {
		
		ModelAndView  modelAndView = new ModelAndView("error");
		modelAndView.addObject("message", e.getMessage());
		return modelAndView;
	}
	
}
