package common;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.market.model.service.MarketService;
import kr.co.mitgomukgo.store.model.service.StoreService;
import kr.co.mitgomukgo.store.model.vo.Review;

@Controller
public class MainController {
	@Autowired
	private StoreService storeService;
	@Autowired
	private MarketService marketService;

	@RequestMapping(value = "/mainFrm.do")
	public String mainFrm(Model model) {
		ArrayList<Review> rList = storeService.selectRandomReviewList();
		model.addAttribute("rList", rList);
		return "main/main";
	}
}