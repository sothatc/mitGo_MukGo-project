package kr.co.mitgomukgo.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {

	public MapController() {
		super();
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "mapFrm.do")
	public String mapFrm() {
		return "map/mapFrm";
	}
}
