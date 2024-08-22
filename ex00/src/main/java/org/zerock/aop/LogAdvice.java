package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

// 자동 생성 - @Controller, @RestController, @Service, @Repository, @Component, @~Advice
@Aspect // AOP 프로그램 지정
@Log4j
@Component
public class LogAdvice {
	
	@Around("execution(* org.zerock.*.service.*ServiceImpl.*(..))")
	// ProceedingJoinPoint - 실행 해야할 객체(~ServiceImpl) + parameter
	public Object logTime(ProceedingJoinPoint pjp) throws Throwable {
	
		// 결과를 저장하는 변수
		Object result = null;
		
		// before 처리
		// 시작시간 저장
		Long start = System.currentTimeMillis();
		log.info(" + ******************* [ AOP 실행 전 로그 출력 ] ****************** + ");
		// 실행되는 객체의 이름 출력
		log.info(" + 실행 객체 & 메서드 : " + pjp.getSignature());
	
		// 전달되는 파라미터 데이터 출력
		log.info(" + 전달 데이터 : " + Arrays.toString(pjp.getArgs()));
		log.info(" + ************************************************************ + ");
	
		// 실행하는 부분 - 다른 AOP가 있으면 그쪽으로 가서 진행 처리 하세요.
		result = pjp.proceed();
		
		// after 처리
		log.info(" + ******************* [ AOP 실행 후 로그 출력 ] ****************** + ");
		// 실행한 결과 출력
		log.info(" + 결과 데이터 : " + result);
		
		// 끝난 시간 저장
		Long end = System.currentTimeMillis();
		
		// 실행 소요시간 출력 - 1/1000 초
		log.info(" + 처리 시간 : " + (end - start) + "ms");
		log.info(" + ************************************************************ + ");
		
		
		return result;
	}

}
