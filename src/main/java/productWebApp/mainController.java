package productWebApp;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sun.net.httpserver.HttpServer;

import productWebApp.dao.ProductDao;
import productWebApp.model.Product;

@Controller
public class mainController {

	@Autowired
	private ProductDao productDao;

	@RequestMapping("/")
	public String homePage() {
		return "index";
	}

	@RequestMapping("/dashboard")
	public String showDashBoard(Model m) {
		List<Product> allProduct = productDao.getAllProduct();
		m.addAttribute("allProducts", allProduct);
		return "dashBoard";
	}

	@RequestMapping("/addProduct")
	public String addProduct(@ModelAttribute("p") Product p, Model m) {
		return "addProduct";
	}

	@RequestMapping("/saveProduct")
	public RedirectView createProduct(@ModelAttribute("p") Product p, HttpServletRequest req, Model m) {
		
		productDao.saveProduct(p);
		RedirectView rv = new RedirectView();
		rv.setUrl(req.getContextPath() + "/dashboard");
		System.out.println(p);
		return rv;
	}
	
	@RequestMapping("/deleteProduct/{id}")
	public RedirectView removeProduct(@PathVariable("id") int pid , Model m , HttpServletRequest req) {
		productDao.deleteProduct(pid);
		m.addAttribute("delMsg", "true");
		RedirectView rv = new RedirectView();
		rv.setUrl(req.getContextPath() + "/dashboard");
		return rv;
	}
		
	@RequestMapping(value="/updateProduct" , method=RequestMethod.POST)
	@Transactional
		public String updateProduct(@RequestParam("pid") int pid ,@ModelAttribute("p") Product p , Model m ) {
		p.setPid(pid);
		productDao.updateProduct(p);
		return "redirect:/dashboard";
		}
	
	
	

}
