package org.zerock.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

// 자동 생성
// @Controller, @RestController, @Service, @Repository, @~Advice
@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	
	// 500번 오류에 대한 모든 예외를 받는다.
	@ExceptionHandler(Exception.class)
	public String exception(Exception ex, Model model) {
		
		// 콘솔에는 간단하게 오류 찍기
		log.error("Exceptoin --------- " + ex.getMessage());
		
		// jsp로 ex를 전달한다.
		model.addAttribute("exception", ex);
		
		// model에 뭐가 담겼는지 확인하기
		log.error(model);
		return "error_page";
	} // 500 error
	
	// 404 오류에 대한 예외 처리 - jsp 가 없는 경우는 처리 안함. -> web.xml 에서 처리 한다.
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		
		return "custom404";
	}

}
