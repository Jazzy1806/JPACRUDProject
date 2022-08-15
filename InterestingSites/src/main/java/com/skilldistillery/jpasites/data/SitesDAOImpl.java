package com.skilldistillery.jpasites.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import com.skilldistillery.jpasites.entities.Site;

@Service
@Transactional
public class SitesDAOImpl implements SitesDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Site findById(int siteId) {
		return em.find(Site.class, siteId);
	}

	@Override
	public List<Site> findAll() {
		String query = "Select s FROM Site s ORDER BY s.name";
		List<Site> sites = em.createQuery(query, Site.class).getResultList();
		return sites;
	}

	@Override
	public boolean createSite(Site site) {
		boolean success = false;
		em.persist(site);
		em.flush();
		success = em.contains(site);
		return success;
	}

	@Override
	public boolean updateSite(int id, Site site) {
		boolean success = false;
		Site updated = em.find(Site.class, id);
		
		updated.setName(site.getName());
		updated.setCountry(site.getCountry());
		updated.setDescription(site.getDescription());
		updated.setLatitude(site.getLatitude());
		updated.setLongitude(site.getLongitude());
		updated.setCategory(site.getCategory());
		updated.setImage(site.getImage());
		
		success = true;
		return success;
	}

	@Override
	public boolean deleteSite(int id) {
		boolean success = false;
		Site deleted = em.find(Site.class, id);
		
		em.remove(deleted);
		
		success = ! em.contains(deleted);
		return success;
	}

	@Override
	public ArrayList<String> findCategories() {
		List<Site> sites = findAll();
		ArrayList<String> categories = new ArrayList<String>();
		for (Site s : sites) {
			if (! categories.contains(s.getCategory())) {
				categories.add(s.getCategory());
			}
		}
		return categories;
	}

	@Override
	public ArrayList<String> findContinents() {
		String query = "Select DISTINCT s FROM Site s ORDER BY s.continent, s.name";
		List<Site> results = em.createQuery(query, Site.class).getResultList();
		ArrayList<String> continents = new ArrayList<String>();
		for (Site s : results) {
			if (!continents.contains(s.getContinent())) {
			continents.add(s.getContinent());
			}
		}
		return continents;
	}
	

}
