package com.georgemusala;

import java.io.*;
import java.nio.file.*;
import java.util.Scanner;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("session")
public class LoginController {

	@Autowired
	private ServletContext context;
	
	//if request is root context then load start page or home page(if logged in)
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView login(HttpSession session)
	{
		ModelAndView model;
		
		//if logged in redirect to home, else load login page
		if(session.getAttribute("currentUser") != null)
			model = new ModelAndView("home");
		else
			model = new ModelAndView("start");
	
		model.addObject("lang",getLang(session)); //set language attribute model from HttpSession
		session.setAttribute("lang", getLang(session));
		return model;
	}
	
	//if request is home and method=POST (made from start.jsp) then do some validation
	@RequestMapping(value="/home", method=RequestMethod.POST)
	public ModelAndView home(@ModelAttribute("welcomeUser") User newUser, @RequestParam("lang") int language, HttpSession session)
	{	//bind welcomeUser from start.jsp form with newUser
		//store "lang" parameter from start.jsp form to language
				
		ModelAndView model;
		
		//getting credentials send by newUser
		Credentials loginData = newUser.getLoginData(); 
		
		//if newUser exists and sent username and password are non-blank check credentials
		//else redirect to start
		if(newUser != null && loginData.getUsername() != null & loginData.getPassword() != null)
		{
			//check credentials
			if(valid(loginData))
			  {
				model = new ModelAndView("home");
				
				//add currentUser to model (and also to HttpSession)
				model.addObject("currentUser",newUser);
				session.setAttribute("currentUser",newUser);
			  }
			else
				model = new ModelAndView("start");
		}
		else
		{
			model = new ModelAndView("start");
		}
		
		//add lang to model (and also to HttpSession)
		model.addObject("lang",language);
		session.setAttribute("lang", language);
		return model;
	}
	
	//if request is home and method=GET (logged in) then do some checks
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView home(@RequestParam(value="lang", defaultValue="-1") int language, HttpSession session)
	{
		//store received "lang" parameter to language
		
		ModelAndView model;
		
				
		//get current logged user (if any) from HttpSession
		User currentUser = (User) session.getAttribute("currentUser");
		
		//check if logged, else redirect to start.jsp
		if(currentUser != null)
		  {
			model = new ModelAndView("home");
			
			//add currentUser to model (and also to HttpSession)
			model.addObject("currentUser", currentUser);
			session.setAttribute("currentUser", currentUser);
		  }
		else
			model = new ModelAndView("start");
		
		//setting correct language value
		language = (language == -1) ? getLang(session):language;
		
		//add lang to model (and also to HttpSession)
		model.addObject("lang",language);
		session.setAttribute("lang", language);
		return model;
	}
	
	
	//logout user
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public ModelAndView logout(@RequestParam(value="lang", defaultValue="-1") int language, HttpSession session)
	{
		ModelAndView model;
		
		//set currentUser in session to null
		session.removeAttribute("currentUser");
		model = new ModelAndView("start");
		
		//setting correct language value
		language = (language == -1) ? getLang(session):language;
		
		//add lang to model (and also to HttpSession)
		model.addObject("lang",language);
		session.setAttribute("lang", language);
		return model;
	}
	
	
	//validate credentials
	public boolean valid(Credentials loginData)
	{
		String appRoot = context.getRealPath("/WEB-INF/credentials.txt");		
		Path filePath = Paths.get(appRoot);
		Scanner in = null;
        try{
                in = new Scanner(filePath);
                while(in.hasNext())
                {
                    String user = in.next();
                       if(user.equals(loginData.getUsername().toLowerCase()))
                        {
                            String pass = in.next();
                                return pass.equals(loginData.getPassword().toLowerCase());
                        }
            
                    user = in.next();
                }
                in.close();
           }
        catch (FileNotFoundException e) {
        			e.printStackTrace();
                }
        catch (IOException e) {
                    e.printStackTrace();              
            }
       return false;
	}
	
	
	//get current language from HttpSession or set as 0 if doesn't exists
	public Integer getLang(HttpSession session)
	{

		if (session.getAttribute("lang") == null)	
			 session.setAttribute("lang", 1);

		return  (Integer) session.getAttribute("lang");
		
	}
	
	
}	

