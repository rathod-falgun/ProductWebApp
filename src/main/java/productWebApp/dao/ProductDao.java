package productWebApp.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import productWebApp.model.Product;

@Component
public class ProductDao  {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void saveProduct(Product p) {
		hibernateTemplate.save(p);
	}
	
	public Product getProduct(int id) {
		return this.hibernateTemplate.get(Product.class, id);
	}
	public void updateProduct(Product p) {
		this.hibernateTemplate.update(p);
	}
	@Transactional
	public void deleteProduct(int pid) {
		Product product = this.hibernateTemplate.load(Product.class, pid);
		 this.hibernateTemplate.delete(product);
	}
	
	public List<Product> getAllProduct(){
		List<Product> products = this.hibernateTemplate.loadAll(Product.class);
		return products;
	}
}
