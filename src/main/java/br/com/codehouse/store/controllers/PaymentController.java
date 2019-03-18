package br.com.codehouse.store.controllers;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.codehouse.store.models.PaymentData;
import br.com.codehouse.store.models.ShopCart;
import br.com.codehouse.store.models.User;

@RequestMapping("/payment")
@Controller
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class PaymentController {

	@Autowired
	private ShopCart shopCart;	
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private MailSender sender;
	
	@RequestMapping(value="/finalize", method=RequestMethod.POST)
	public Callable<ModelAndView> finalize(@AuthenticationPrincipal User user, RedirectAttributes model) {
		
		return () -> {
			String uri = "http://book-payment.herokuapp.com/payment";
			try {
				String response = restTemplate.postForObject(uri, new PaymentData(shopCart.getTotal()), String.class);
				
				System.out.println(response);
				sendConfirmationEmail(user);
				
				model.addFlashAttribute("sucesso", "Pagamento realizado com sucesso!");		
				return new ModelAndView("redirect:/products");	
			} catch (HttpClientErrorException e) {
				e.printStackTrace();
				model.addFlashAttribute("falha", "Valor maior que o permitido");
				return new ModelAndView("redirect:/products");	
			}
		};
		
	}

	private void sendConfirmationEmail(User user) {
		
		SimpleMailMessage simpleMail = new SimpleMailMessage();
		simpleMail.setSubject("Compra Finalizada com sucesso!");
		//simpleMail.setTo(user.getEmail());
		simpleMail.setTo("marcos.dealmeida@torvs.com.br");
		simpleMail.setText("Compra aprovada com sucesso no valor de " + shopCart.getAmount());
		simpleMail.setFrom("compra@codehouse.com.br");
		
		try {
			sender.send(simpleMail);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
	
}
