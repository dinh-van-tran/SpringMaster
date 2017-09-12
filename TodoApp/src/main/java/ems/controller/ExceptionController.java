package ems.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@ControllerAdvice
@EnableWebMvc
public class ExceptionController {
    private static Logger logger = Logger.getLogger( ExceptionController.class );

    public String handleError(HttpServletRequest req, Exception exception) {
        logger.error( "Request: " + req.getRequestURL() + " raised" + exception );
        return "error";
    }
}
