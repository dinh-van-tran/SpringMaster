package ems.controller;

import ems.service.TodoService;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TodoController {
    private TodoService todoService;

    @RequestMapping( value = "/list-todos", method = RequestMethod.GET )
    public String showTodoList( ModelMap model ) {
        model.addAttribute( "todos", todoService.getAll( getUsername() ) );
        return "list-todos";
    }

    private String getUsername() {
        Object principal = SecurityContextHolder.getContext().getAuthentication();
        if ( principal instanceof UserDetails ) {
            return ((UserDetails) principal).getUsername();
        }
        return principal.toString();
    }
}
