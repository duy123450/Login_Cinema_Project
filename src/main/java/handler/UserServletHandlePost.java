package handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

public class UserServletHandlePost {
	private UserDAO userDAO;
	
	public UserServletHandlePost() {
		this.userDAO = new UserDAO();
	}
	
	public void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("usernameInput");
		String password = request.getParameter("passwordInput");
		
		User loginUser = this.userDAO.getUserByUsername(username);
		if(loginUser != null && password.equals(loginUser.getPassword())) {
			request.getSession().setAttribute("loginUser", loginUser);
			System.out.println("Login success");
			response.sendRedirect("./home");
		} else {
			System.out.println("Login failed");
			request.getRequestDispatcher("./login").forward(request, response);
		}
	}
	
	public void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (password == null || confirmPassword == null || !password.equals(confirmPassword)) {
            request.setAttribute("error", "Wrong password!");
            request.getRequestDispatcher("./register").forward(request, response);
            return;
        }
        
        UserDAO userDAO = new UserDAO();
        if (userDAO.getUserByUsername(username) != null) {
            request.setAttribute("error", "Username exists!");
            request.getRequestDispatcher("./register").forward(request, response);
            return;
        }
        
        User newUser = new User();
        newUser.setFullname(fullname);
        newUser.setEmail(email);
        newUser.setUsername(username);
        newUser.setAddress(address);
        newUser.setPassword(password);
        newUser.setRoleName("customer");
        
        boolean success = userDAO.createUser(newUser);
        if (!success) {
        	request.setAttribute("error", "Failed to register. Please try again.");
            request.getRequestDispatcher("./register").forward(request, response);
            return;
        }
        response.sendRedirect("./login");
	}
	
	public void handleCreateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullName = request.getParameter("fullNameInput");
		String email = request.getParameter("emailInput");
		String username = request.getParameter("usernameInput");
		String password = request.getParameter("passwordInput");
		String address = request.getParameter("addressInput");
		String roleName = request.getParameter("roleNameInput");
		
		if(this.userDAO.getUserByUsername(username) != null) {
			System.out.println("Username of user is already exists");
			response.sendRedirect("./getUsers");
			return;
		}
		
		if(this.userDAO.getUserByEmail(email) != null) {
			System.out.println("Email of user is already exists");
			response.sendRedirect("./getUsers");
			return;
		}
		
		User newUser = new User();
		newUser.setFullname(fullName);
		newUser.setEmail(email);
		newUser.setUsername(username);
		newUser.setPassword(password);
		newUser.setAddress(address);
		newUser.setRoleName(roleName);
		if(!this.userDAO.createUser(newUser)) {
			System.out.println("Create user failed");
			response.sendRedirect("./getUsers");
			return;
		}
		
		System.out.println("Create user successful");
		response.sendRedirect("./getUsers");
	}
	
	public void handleUpdateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("idInput"));
		String fullName = request.getParameter("fullNameInput");
		String email = request.getParameter("emailInput");
		String address = request.getParameter("addressInput");
		String roleName = request.getParameter("roleNameInput");
		
		User foundUser = this.userDAO.getUserById(id);
		foundUser.setFullname(fullName);
		if(!foundUser.getEmail().equals(email)) {
			if(this.userDAO.getUserByEmail(email) != null) {
				System.out.println("Email of user is already exists");
				response.sendRedirect("./getUserDetail?id=" + id);
				return;
			}else {
				foundUser.setEmail(email);
			}
		}
		foundUser.setAddress(address);
		foundUser.setRoleName(roleName);
		if(!this.userDAO.updateUser(foundUser)) {
			System.out.println("Update user failed");
			response.sendRedirect("./getUserDetail?id=" + id);
			return;
		}
		
		System.out.println("Update user successful");
		response.sendRedirect("./getUserDetail?id=" + id);
	}
}
