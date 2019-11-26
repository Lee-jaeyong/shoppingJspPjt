package shopping.backend.model;

import java.sql.SQLException;

import javax.naming.NamingException;

import shopping.database.dao.CategoryDAO;

public class AddCategory {
	public AddCategory(String categoryType, String categoryName) throws SQLException, NamingException {
		CategoryDAO categoryDAO = new CategoryDAO();
		categoryDAO.insertCategory(categoryType, categoryName);
	}
}
