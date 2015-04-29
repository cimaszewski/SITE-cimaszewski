<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<%@ page import="org.sitenv.portlets.providerdirectory.SingleTestPortlet" %>

<portlet:defineObjects />



<script type="text/javascript">
	window.runTestsUrl = "/site-portal-providerdirectory-servlet/GetPDGISingleTest";

	window.currentContextPath = "<%=request.getContextPath()%>";
</script>

<div id="providerDirectoryWidget" class="panel panel-default">
      <div class="panel-heading"><h2 class="panel-title">Provider Information Directory (Server) Test Cases</h2></div>
  		<div class="panel-body">
	
	<div class="directions">Directions</div>
	<ol>
		<li>Import the test data provided following <a href="https://github.com/siteadmin/pdti" tabindex="1">these instructions</a></li>
		<li>Once the data is imported into the directory, enter your WSDL below.</li>
		<li>Specify you based DN</li>
		<li>Select the test case and execute</li>
	</ol>
     
<div class="well">
  <form action="/site-portal-providerdirectory-servlet/GetPDGISingleTest" name="testForm" method="post" id="providerDirectoryTestForm">
      
<p>
	  <label for="endpointUrl">Enter Your Endpoint URL:</label>
      <input id="endpointUrl" name="endpointUrl" type="text" value="" class="validate[required,custom[url]] form-control"  tabindex="1"/>
</p>
<p>      
      <label for="baseDn">Enter Your Base DN:</label>
      <input id="baseDn" name="baseDn" type="text" value="" class="validate[required] form-control"  tabindex="1"/>
</p>
<p>      
      <label for="testCase">Select a Test Case:</label>
      <select id="testCase" name="testCase" class="validate[required] form-control"  tabindex="1">
        <option value="run_all_test_cases">Run All Test Cases</option>
        <% for (String testCase : SingleTestPortlet.testCaseNames) { %>
        	<option value="<%= testCase %>"><%= SingleTestPortlet.testCaseRealNames.get(testCase) %></option>
        <% } %>
      </select>
</p>
<p> 
	<hr/>     
      <button id="querySubmit" type="submit" class="btn btn-primary start" onclick="return false;"  tabindex="1">
      	<span class="glyphicon glyphicon-ok"></span>
          <span>Run Test Case</span>
      </button>

</p>
  </form> 

  </div>
  </div>
</div>


<div class="panel panel-default">
      <div class="panel-heading"><h2 class="panel-title">Provider Directory Client Testing</h2></div>
  		<div class="panel-body">

	PD clients that would like to verify their systems are generating conformant PD search requests following the IHE HPD specification can issue requests against the Provider Directory Test Implementation (PDTI) setup at the following WSDL:<br /><br />
http://54.201.181.21/pdti-server/ProviderInformationDirectoryService?wsdl<br /><br />
The PDTI has the test data loaded as specified above, and clients can verify the results, based on their search requests, by manually cross-checking results against the test data.
  </div>
</div>


<div class="modal modal-wide fade" id="resultsDialog" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" aria-hidden="true">
	      	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h1 style="font-size: 2em; margin-top: 0px;">Provider Directory Server Test Results</h1>
				</div>
				<div class="modal-body" id="PDResult">
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close Results</button>
				</div>
			</div>
			</div>
			</div>

<portlet:renderURL var="viewUrl">
        <portlet:param name="mvcPath" value="/view.jsp" />
</portlet:renderURL>
