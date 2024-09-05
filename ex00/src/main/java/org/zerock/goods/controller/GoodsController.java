package org.zerock.goods.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
// import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.category.service.CategoryService;
import org.zerock.goods.service.GoodsService;
import org.zerock.goods.vo.GoodsImageVO;
import org.zerock.goods.vo.GoodsOptionVO;
import org.zerock.goods.vo.GoodsSizeColorVO;
import org.zerock.goods.vo.GoodsVO;

import com.webjjang.util.file.FileUtil;
import com.webjjang.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods")
@Log4j
public class GoodsController {

	// 자동 DI
	// @Setter(onMethod_ = @Autowired)
	// Type이 같으면 식별할 수 있는 문자열 지정 - id를 지정
	@Autowired
	@Qualifier("goodsServiceImpl")
	private GoodsService service;
	
	@Autowired
	@Qualifier("categoryServiceImpl")
	private CategoryService categoryService;
	
	// 파일 저장 위치
	String path = "/upload/goods";
	
	
	//--- 상품 리스트 ------------------------------------
	@GetMapping("/list.do")
	// 검색을 위한 데이터를 따로 받아야 한다.
	// public ModelAndView list(Model model) {
	public String list(Model model, HttpServletRequest request)
			throws Exception {
	//	public String list(HttpServletRequest request) {
		log.info("list.do");
		// request.setAttribute("list", service.list());
		
		// 페이지 처리를 위한 객체 생겅
		PageObject pageObject = PageObject.getInstance(request);
		
		// 한 페이지 당 보여주는 데이터의 개수가 없으면 기본은 8로 정한다.
		String strPerPageNum = request.getParameter("perPageNum");
		if(strPerPageNum == null || strPerPageNum.equals(""))
			pageObject.setPerPageNum(8);
		
		// model에 담으로 request에 자동을 담기게 된다. - 처리된 데이터를 Model에 저장
		model.addAttribute("list", service.list(pageObject));
		// pageObject에 데이터 가져 오기 전에는 시작 페이지, 끝 페이지, 전체 페이지가 정해지지 않는다.
		log.info(pageObject);
		model.addAttribute("pageObject", pageObject);
		// 검색에 대한 정보도 넘겨야 한다.
		
		return "goods/list";
	}
	
	//--- 상품관리 글보기 ------------------------------------
	@GetMapping("/view.do")
	public String view(Model model, Long no, int inc) {
		log.info("view.do");
		
		model.addAttribute("vo", service.view(no, inc));
		
		return "goods/view";
	}
	
	//--- 상품관리 글등록 폼 ------------------------------------
	@GetMapping("/writeForm.do")
	public String writeForm(Model model) {
		log.info("writeForm.do");
		// 대분류를 가져와서 JSP로 넘기기
		model.addAttribute("bigList", categoryService.list(0));
		return "goods/writeForm";
	}
	
	
	//--- 상품관리 등록 처리 ------------------------------------
	@PostMapping("/write.do")
	public String write(GoodsVO vo,
			// 대표이미지
			MultipartFile imageFile, 
			// 상세 설명 이미지
			MultipartFile detailImageFile,
			// 추가 이미지들
			ArrayList<MultipartFile> imageFiles,
			// 옵션들 받기 - 사이즈, 컬러, 옵션 : 데이터 한개의 단위인 경우 @RequestParam 을 붙혀야 받을 수 있다.
			// ArrayList<> 로 받을 때 null 인 경우 오류가 발생한다. required = false 를 써야 한다.
			// 배열은 오류가 나지 않는다.
			@RequestParam(name = "size_nos", required = false) ArrayList<Long> size_nos, 
			@RequestParam(name = "color_nos", required = false) ArrayList<Long> color_nos, 
			@RequestParam(name = "option_names", required = false) ArrayList<String> option_names,
			RedirectAttributes rttr,
			// multipart로 파일 업로드를 하기 위해 request 필요
			HttpServletRequest request
			) throws Exception {
		
		log.info("write.do -------------------------------------------------------");
		log.info(vo);
		log.info("대표 이미지 : " + imageFile.getOriginalFilename());
		log.info("상세 설명 이미지 : " + detailImageFile.getOriginalFilename());
		
		// 추가 이미지 for문으로 가져오기
		log.info("<< 첨부 이미지들 >>");
		for(MultipartFile file: imageFiles) {
			log.info("추가 이미지 : " + file.getOriginalFilename());
		}
		
		// 사이즈, 색상, 옵션
		log.info("사이즈 데이터 : " + size_nos);
		log.info("색상 데이터 : " + color_nos);
		log.info("옵션 데이터 : " + option_names);
		
		// 이미지 올리기와 DB에 저장할 데이터 수집
		log.info("대표 이미지 처리 전 : " + vo.getImage_name());
		// 대표 이미지 처리
		vo.setImage_name(FileUtil.upload(path, imageFile, request));
		log.info("대표 이미지 처리 후 : " + vo.getImage_name());
		
		String fileName = detailImageFile.getOriginalFilename();
		
		// 상품 상세 이미지 처리
		if(fileName != null && !fileName.equals(""))
			vo.setDetail_image_name(FileUtil.upload(path, detailImageFile, request));
		
		List<GoodsImageVO> goodsImageList = null;
		// 첨부 이미지 - GoodsImageVO
		if(imageFiles != null && imageFiles.size() > 0) {
			for(MultipartFile file : imageFiles) {
				if (goodsImageList == null) goodsImageList = new ArrayList<>();
				
				fileName = file.getOriginalFilename();
				
				if(fileName != null && !fileName.equals("")) {
					GoodsImageVO imageVO = new GoodsImageVO();
					imageVO.setImage_name(FileUtil.upload(path, file, request));
					goodsImageList.add(imageVO);
				}
			}
		}
		log.info(vo);
		log.info("상세 이미지 첨부 : " + goodsImageList);
		
		
		// 사이즈와 컬러 데이터 처리 - 데이터 개수 : 사이즈 * 컬러 - GoodsSizeColorVO
		List<GoodsSizeColorVO> goodsSizeColorList = null;
		
		// 사이즈 처리
		if(size_nos != null && size_nos.size() > 0) {
			for (Long size_no : size_nos) {
				if (goodsSizeColorList == null) goodsSizeColorList = new ArrayList<>();
				
				// 컬러가 있을 때 처리
				if(color_nos != null && color_nos.size() > 0) {
					for (Long color_no : color_nos) {
						// 저장 객체
						GoodsSizeColorVO sizeColorVO = new GoodsSizeColorVO();
						
						// size * color
						sizeColorVO.setSize_no(size_no);
						sizeColorVO.setColor_no(color_no);
						
						goodsSizeColorList.add(sizeColorVO);
					}
					
				} else { // color 가 없고 사이즈만 있는 경우. color == null
					GoodsSizeColorVO sizeColorVO = new GoodsSizeColorVO();
					sizeColorVO.setSize_no(size_no);
					
					goodsSizeColorList.add(sizeColorVO);
				}
			}
		}
		
		log.info("사이즈 & 컬러 : " + goodsSizeColorList);
		
		// 옵션 - GoodsOptionVO
		List<GoodsOptionVO> goodsOptionList = null;
		
		if(option_names != null && option_names.size() > 0) {
			for(String option : option_names) {
				if(goodsOptionList == null) goodsOptionList = new ArrayList<>();
				
				GoodsOptionVO optionVO = new GoodsOptionVO();
				optionVO.setOption_name(option);
				
				goodsOptionList.add(optionVO);
			}
		}
		
		log.info("옵션 : " + goodsOptionList);
		
		
//		service.write(vo);
		
		// 처리 결과에 대한 메시지 처리
		rttr.addFlashAttribute("msg", "상품 등록이 되었습니다.");
		
		// return "redirect:list.do";
		return null;
	}
	
	//--- 상품관리 글수정 폼 ------------------------------------
	@GetMapping("/updateForm.do")
	public String updateForm(Long no, Model model) {
		log.info("updateForm.do");
		
		
		
		model.addAttribute("vo", service.view(no, 0));
		
		return "goods/updateForm";
	}
	
	//--- 상품관리 글수정 처리 ------------------------------------
	@PostMapping("/update.do")
	public String update(GoodsVO vo, RedirectAttributes rttr) {
		log.info("update.do");
		log.info(vo);
		if(service.update(vo) == 1)
			// 처리 결과에 대한 메시지 처리
			rttr.addFlashAttribute("msg", "상품관리 글수정이 되었습니다.");
		else
			rttr.addFlashAttribute("msg",
					"상품관리 글수정이 되지 않았습니다. "
					+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
		
		return "redirect:view.do?no=&inc=0";
	}
	
	
	//--- 상품관리 글삭제 처리 ------------------------------------
	@PostMapping("/delete.do")
	public String delete(GoodsVO vo, RedirectAttributes rttr) {
		log.info("delete.do");
		log.info(vo);
		// 처리 결과에 대한 메시지 처리
		if(service.delete(vo) == 1) {
			rttr.addFlashAttribute("msg", "상품관리 글삭제가 되었습니다.");
			return "redirect:list.do";
		}
		else {
			rttr.addFlashAttribute("msg",
					"상품관리 글삭제가 되지 않았습니다. "
							+ "글번호나 비밀번호가 맞지 않습니다. 다시 확인하고 시도해 주세요.");
			return "redirect:view.do?no=&inc=0";
		}
	}
	
}
