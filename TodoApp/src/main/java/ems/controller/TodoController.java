package ems.controller;

import ems.model.Todo;
import ems.service.TodoService;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping( value = "/add-todo", method = RequestMethod.GET )
    public String ShowAddTodoPage( ModelMap model ) {
        model.addAttribute( "todo", new Todo() );
        return "todo";
    }

    @RequestMapping( value = "/add-todo", method = RequestMethod.POST )
    public String ShowAddTodoPage( ModelMap model, @PathVariable Todo todo ) {
        todo.setUser( getUsername() );
        todoService.addTodo( todo );
        return "redirect:/list-todos";
    }

    private String getUsername() {
        Object principal = SecurityContextHolder.getContext().getAuthentication();
        if ( principal instanceof UserDetails ) {
            return ((UserDetails) principal).getUsername();
        }
        return principal.toString();
    }
}
