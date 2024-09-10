package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
// 자동 DI - Private 변수가 많을 때 - 한꺼번에 생성자를 이용 해서 데이터를 세팅할 수 있다.
// @AllArgsConstructor
public class Restaurant {
	
	// 자동 DI - 3가지 방법
	// lombok의 자동 DI : @Setter(onMethod_ = @Autowired)
	// Spring : @Autowired
	// Java : @Inject
	@Setter(onMethod_ = @Autowired)
	private Chef chef;

}
