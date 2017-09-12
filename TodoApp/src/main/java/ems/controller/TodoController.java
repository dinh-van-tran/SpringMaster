package ems.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import ems.service.TodoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TodoController {
    @Autowired
    private TodoService todoService;

    @RequestMapping( value = "/list-todos", method = RequestMethod.GET )
    public String showTodoList( ModelMap model ) {
        model.addAttribute( "todos", todoService.getAll( getUsername() ) );
        return "list-todos";
    }

    @RequestMapping( value = "/add-todo", method = RequestMethod.GET )
    public String showAddTodoPage( ModelMap model ) {
        return "todo";
    }

    @RequestMapping( value = "/add-todo", method = RequestMethod.POST )
    public String addTodo( ModelMap model, @RequestParam(required=true) String desc,
                                           @RequestParam(required=true) String targetDate) {
        todoService.addTodo( getUsername(), desc, parseDateInput(targetDate), false );
        return "redirect:/list-todos";
    }

    private String getUsername() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if ( principal instanceof UserDetails ) {
            return ((UserDetails) principal).getUsername();
        }
        return principal.toString();
    }

    private Date parseDateInput(String source) {
        DateFormat df = new SimpleDateFormat("dd/mm/yyyy");
        if(source != null && !source.isEmpty()) {
            try {
                Date result = df.parse( source );
                return result;
            } catch ( ParseException e ) {
                e.printStackTrace();
            }
        }
        return new Date();
    }
}
