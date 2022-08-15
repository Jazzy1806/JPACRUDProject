package com.skilldistillery.jpasites.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.jpasites.data.SitesDAO;
import com.skilldistillery.jpasites.entities.Site;

@Controller
public class SiteController {
	
	@Autowired
	private SitesDAO dao;
	
	@RequestMapping(path={"/", "index.do"})
	public String index(Model model) {
		model.addAttribute("categories", dao.findCategories());
		model.addAttribute("continents", dao.findContinents());
		model.addAttribute("allSites", dao.findAll());
		return "index";
	}
	
	@RequestMapping(path="details.do")
	public String index(Model model, int id) {
		Site site = dao.findById(id);
		model.addAttribute("site", site);
		model.addAttribute("siteError", "Sorry, something went wrong. Please try another site or try again later.");
		return "siteInfo";
	}
	
	@RequestMapping(path="categorySites.do")
	public String getSitesByCategory(String category, Model model) {
		List<Site> allSites = dao.findAll();
		List<Site> sitesByCat = new ArrayList<Site>();
		for (Site s : allSites) {
			if (category.startsWith(s.getCategory())) {
				sitesByCat.add(s);
			}
		}
		model.addAttribute("categories", dao.findCategories());
		model.addAttribute("allSites", allSites);
		model.addAttribute("siteList", sitesByCat);
		model.addAttribute("siteListSize", sitesByCat.size());
		model.addAttribute("categoryFail", "There are no sites that match your search. \n\n\n We are still expanding our site list. If you'd like to contribute, click \"Add a site\"!");
		return "index";
	}
	
	@RequestMapping(path="continentSites.do")
	public String getSitesByCountry(String con, Model model) {
		List<Site> allSites = dao.findAll();
		List<Site> sitesByCon = new ArrayList<Site>();
		for (Site s : allSites) {
			if (con.equalsIgnoreCase(s.getContinent())) {
				sitesByCon.add(s);
			}
		}
		model.addAttribute("categories", dao.findCategories());
		model.addAttribute("continents", dao.findContinents());
		model.addAttribute("allSites", dao.findAll());
		model.addAttribute("sitesByContinent", sitesByCon);
		model.addAttribute("sitesByContinentSize", sitesByCon.size());
		model.addAttribute("continentFail", "There are no sites that match your search. \n\n\n We are still expanding our site list. If you'd like to contribute, click \"Add a site\"!");
		return "index";
	}

	
	@RequestMapping(path="newSite.do", method= RequestMethod.GET)
	public String newSiteForm(Model model) {
		model.addAttribute("categories", dao.findCategories());
		model.addAttribute("continents", dao.findContinents());
		return "addSiteForm";
	}
	
	@RequestMapping(path = "newSite.do", method = RequestMethod.POST)
	public String newSiteInfo(Site site, Model model, RedirectAttributes redir) {
		redir.addFlashAttribute("siteAdded", dao.createSite(site));
		redir.addAttribute("id", site.getId());
		redir.addFlashAttribute("addMessage", "Site was successfully added.");
		redir.addFlashAttribute("addFail", "There was a problem adding the site.");
		return "redirect:details.do"; 
	}
	
	@RequestMapping(path="editSite.do", method= RequestMethod.GET)
	public String editSiteForm(Model model, @RequestParam int id) {
		model.addAttribute("site", dao.findById(id));
		model.addAttribute("categories", dao.findCategories());
		model.addAttribute("continents", dao.findContinents());
		return "updateSiteForm";
	}
	
	@RequestMapping(path = "editSite.do", method = RequestMethod.POST)
	public String editSiteInfo(Site site, @RequestParam("id") int id, Model model, RedirectAttributes redir) {
		redir.addFlashAttribute("siteUpdated", dao.updateSite(id, site));
		redir.addAttribute("id", site.getId());
		redir.addFlashAttribute("editMessage", "Site was successfully updated.");
		redir.addFlashAttribute("editFail", "There was a problem updating the site.");
		return "redirect:details.do"; 
	}
	
	@RequestMapping(path="confirmDelete.do", method= RequestMethod.GET)
	public String deleteSiteForm(Model model, @RequestParam int id) {
		model.addAttribute("site", dao.findById(id));
		return "deleteSiteForm";
	}
	
	@RequestMapping(path = "delete.do", method = RequestMethod.POST)
	public String deleteSite(Site site, @RequestParam("id") int id, Model model, RedirectAttributes redir) {
		redir.addFlashAttribute("siteDeleted", dao.deleteSite(id));
		return "redirect:index.do"; 
	}
}
