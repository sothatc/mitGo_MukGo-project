package common;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mitgomukgo.market.model.service.MarketService;
import kr.co.mitgomukgo.market.model.vo.Market;
import kr.co.mitgomukgo.store.model.service.StoreService;
import kr.co.mitgomukgo.store.model.vo.Review;
import kr.co.mitgomukgo.store.model.vo.Store;

@Controller
public class MainController {
	@Autowired
	private StoreService storeService;
	@Autowired
	private MarketService marketService;

	@RequestMapping(value = "/mainFrm.do")
	public String mainFrm(Model model) {
		ArrayList<Review> rList = storeService.selectRandomReviewList();
		ArrayList<Market> mList = marketService.selectRandomMarketList();
		ArrayList<Store> sList = storeService.selectRandomStoreList();
		model.addAttribute("rList", rList);
		model.addAttribute("mList", mList);
		model.addAttribute("sList", sList);
		return "main/main";
	}
}