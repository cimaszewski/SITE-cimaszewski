package org.sitenv.portlets.smtpdirectedgetransport.views;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component("directEdgeSMTPSearchResultsJsonView")
public class DirectEdgeSMTPSearchResultsJsonView extends AbstractView {
	
	private Logger logger = Logger.getLogger(DirectEdgeSMTPSearchResultsJsonView.class);
	
	public DirectEdgeSMTPSearchResultsJsonView() {
		super();
		
		setContentType("text/plain");
	}
	
	@Override
    protected void renderMergedOutputModel(Map map, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    logger.info("Resolving ajax request view - " + map);
    
    JSONObject jsonObj = new JSONObject();
    jsonObj.put("searchResults", map.get("searchResults"));
    
    logger.info(jsonObj.toString());

    logger.info("content Type = " + getContentType());
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(jsonObj.toString());
    response.getWriter().flush();
    }

}
