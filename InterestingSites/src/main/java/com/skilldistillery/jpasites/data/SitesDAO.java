package com.skilldistillery.jpasites.data;

import java.util.ArrayList;
import java.util.List;

import com.skilldistillery.jpasites.entities.Site;

public interface SitesDAO {
	Site findById(int siteId);
	List<Site> findAll();
	boolean createSite(Site site);
	boolean deleteSite(int id);
	boolean updateSite(int id, Site site);
	ArrayList<String> findCategories();
	ArrayList<String> findContinents();
	
}
