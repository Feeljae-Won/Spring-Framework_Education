package org.zerock.sample;

import org.springframework.stereotype.Component;

import lombok.Data;

// 자동 생성을 위한 어노테이션
// - @Controller : url 과 연결되어 있다.
// - @Service : 데이터 처리
// - @Repository : 데이터 저장을 위한 레파지토리 == DAO
// - @Component : 구성체
// - @RestController : rest 형식의 데이터, Ajax 처리할 때 사용
// - @~Advice : 예외 처리
@Component
@Data
public class Chef {

}
