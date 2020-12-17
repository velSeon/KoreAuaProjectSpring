package com.controller.diction;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.DictionDTO;
import com.dto.PageDTO;
import com.service.DictionService;

@Controller
public class DictionController {

	@Autowired
	DictionService service; 
	
	@RequestMapping(value="/Diction", method = RequestMethod.GET)

	public ModelAndView DictionServlet(@RequestParam(required=false, defaultValue="hnm") String hnm,
			@RequestParam(required=false, defaultValue="1") String curPage) {
	
		PageDTO pDTO = service.searchAll(Integer.parseInt(curPage), hnm);
		List<DictionDTO> list = pDTO.getList();
		int perPage = pDTO.getPerPage();
		int totalCount = pDTO.getTotalCount();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("perPage",perPage);
		mav.addObject("totalCount",totalCount);
		mav.addObject("curPage",curPage);
		mav.addObject("list", list);
		mav.addObject("test", "test");
		mav.setViewName("Diction");
		return mav; 
		
	}
	
	
}