package ems.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.service.TodoService;

@RestController
public class TodoRestController {
    @Autowired
    private TodoService todoService;

    @RequestMapping( value = "/delete-todo", method = RequestMethod.POST)
    public boolean deleteTodo(ModelMap model, @RequestParam(required=true) int id) {
        return todoService.remove(id);
    }
}
