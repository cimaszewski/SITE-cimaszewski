      <%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
      <%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
      <%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
      <%@ page import="com.liferay.portal.kernel.util.ParamUtil"%>
      <%@ page import="com.liferay.portal.kernel.util.Validator"%>
      <%@ page import="com.liferay.portlet.PortletPreferencesFactoryUtil" %>
      <%@ page import="javax.portlet.PortletPreferences"%>
      <%@ page import="com.liferay.util.PwdGenerator"%>
      <%@ page import="com.liferay.portal.service.PortletPreferencesLocalServiceUtil" %>
      <%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
      <%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://sitenv.org/tags" prefix="site" %>
      <%@ page import="org.sitenv.common.utilities.enums.CcdaType"%>
      
      
      
      <portlet:actionURL var="sampleCCDATree" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="sampleCCDATree"/>
      </portlet:actionURL>
      
      <portlet:actionURL var="reconciledCCDATree" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="reconciledCCDATree"/>
      </portlet:actionURL>
      
      <portlet:actionURL var="referenceCCDATree" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="referenceCCDATree"/>
      </portlet:actionURL>
      
      <portlet:actionURL var="referenceCCDAIncorpTree" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="referenceCCDAIncorpTree"/>
      </portlet:actionURL>
      
      <portlet:actionURL var="negativeTestCCDATree" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="negativeTestCCDATree"/>
      </portlet:actionURL>
      
      <portlet:actionURL var="urlAction1_1" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="uploadCCDA1.1"/>
	  </portlet:actionURL>
	  
	  <portlet:actionURL var="urlAction2_0" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="uploadCCDA2.0"/>
	  </portlet:actionURL>
	  
	  
	  <portlet:actionURL var="urlActionReconciled" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="uploadCCDAReconciled"/>
	  </portlet:actionURL>
	  
	  <portlet:actionURL var="urlActionReference" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="uploadCCDAReference"/>
	  </portlet:actionURL>
	  
	  <portlet:actionURL var="urlActionSuper" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="uploadCCDASuper"/>
	  </portlet:actionURL>
	  
	  <portlet:actionURL var="smartCCDAAction" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
    	<portlet:param name="javax.portlet.action" value="smartCCDA"/>
	  </portlet:actionURL>
      
	  
	  <portlet:resourceURL id="saveAsPDF"  var="downloadCCDAAction">
	  </portlet:resourceURL>
	  
	  
	  
	  <portlet:resourceURL id="downloadReconciledBundle"  var="downloadReconciledBundleAction">
      </portlet:resourceURL>
	  
	  <portlet:resourceURL id="downloadReferenceTestData"  var="downloadReferenceTestDataAction">
      </portlet:resourceURL>
	  
	  <portlet:resourceURL id="downloadTestInputFile"  var="downloadTestInputAction">
      </portlet:resourceURL>
	  
      <portlet:resourceURL id="downloadVendorIncorporation"  var="downloadVendorIncorporationAction">
      </portlet:resourceURL>
      
      <portlet:resourceURL id="downloadReferenceTreeIncorporation"  var="downloadReferenceTreeIncorporationAction">
      </portlet:resourceURL>
      
      <portlet:resourceURL id="downloadNegativeTestTreeIncorporation"  var="downloadNegativeTestTreeIncorporationAction">
      </portlet:resourceURL>
      
            
      
      <portlet:defineObjects />
      
      
      <portlet:actionURL var="editCaseURL" name="uploadFile">
          <portlet:param name="jspPage" value="/Upload.jsp" />
      </portlet:actionURL>
      
      <liferay-ui:success key="success" message="CCD upload completed!" />
      
      <liferay-ui:error key="error" message="CCD contains error(s)." /> 
      
     
      <script type="text/javascript">
      	window.currentContextPath = "<%=request.getContextPath()%>";
    	
      	var sampleCCDATreeURL = '${sampleCCDATree}';
    	
      	var showVocab = '${showVocabulary}';
    	var showVocabularyValidation = (showVocab === 'true');
    	
    	var showDataQualityValidation = '${showDataQualityValidation}';
    	
    	var reconciledCCDATreeURL = '${reconciledCCDATree}';
    	var referenceCCDATreeURL = '${referenceCCDATree}'; 
    	var referenceCCDAIncorpTreeURL = '${referenceCCDAIncorpTree}';
    	var negativeTestCCDATreeURL = '${negativeTestCCDATree}';
      </script>
      
      
      
      <div id="CCDAvalidator" class="panel panel-default">
      	<div class="panel-heading"><h2 class="panel-title">C-CDA Validator</h2></div>
       
  			<div class="panel-body">
  			
      		<p>To perform C-CDA validation, please select a C-CDA validator below. <br/><br/>Please note: validation may take up to one minute to run.</p>
      		
      		
      		<div class="panel-group well" id="CCDAAccordion">
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h3 class="panel-title">
			        <a data-toggle="collapse" data-parent="#CCDAAccordion" href="#collapseCCDA1_1" tabindex="1">
			          C-CDA R1.1 / MU Stage 2 Validator
			        </a>
			      </h3>
			    </div>
			    <div id="collapseCCDA1_1" class="panel-collapse collapse">
			      <div class="panel-body">
			      
				      <div id="CCDA11">
	  				
	  					<div id="CCDA1wrapper">
	  						<span class="directions">Directions:</span>
	  						<ol>
	  							<li>Please select an MU Stage 2 objective or "CCDA R1.1 Document" from the drop down list.</li>
	  							<li>Upload the C-CDA file generated by your system to validate against the criteria selected in step 1.</li>
	  							<li>Click "Validate Document".</li>

	  						</ol>
	  						
					       	<form id="CCDA1ValidationForm" action="${urlAction1_1}" method="POST" relay="<%= smartCCDAAction %>" enctype="multipart/form-data">
					      		
					      		<div id="ccda_type_radioboxgroup" class="btn-group-vertical">
					      			<label for="CCDA1_type_val">Select a C-CDA Document Type or MU Stage 2 Objective:</label><br/>
					      			<site:ccdaTypesSelector id="CCDA1_type_val" name="CCDA1_type_val" styleClass="form-control" tabIndex="1"/> 	
								</div>
								<br/><br/>
								<noscript><input type="hidden" name="redirect" value="true" /></noscript>
								<div id="ccdauploaderrorlock" style="position: relative;">
									<div class="row">
										<div class="col-md-12 form-group">
											<label for="CCDA1fileupload">Upload C-CDA file to Validate:</label><br/>
											<span class="btn btn-success fileinput-button" id="CCDA1fileupload-btn"> <i
													class="glyphicon glyphicon-plus"></i>&nbsp;<span>Upload a C-CDA File...</span>
													<input id="CCDA1fileupload" type="file" name="file" data-parsley-maxsize="3" data-parsley-filetype="xml" data-parsley-required data-parsley-trigger="change" data-parsley-required-message="Please select a C-CDA file." tabindex="1"/>
											</span>
											<div id="CCDA1files"></div>
											<div id="CCDA1InfoArea" class="infoArea alert-danger"></div>
										</div>
									</div>
								</div>
								<hr/>
								<!--<button id="CCDA1formSubmit" type="submit" class="btn btn-primary start" onclick="return false;"  tabindex="1">
												<i class="glyphicon glyphicon-ok"></i> <span>Validate Document</span>
											</button>-->
											
								<button id="CCDA1formSubmit" type="submit" class="btn btn-primary start" tabindex="1">
												<i class="glyphicon glyphicon-ok"></i> <span>Validate Document</span>
								</button>
								
					      	</form>
				      	</div>
				      	
			      	</div>
			      
			      
			      </div>
			    </div>
			  </div>
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h3 class="panel-title">
			        <a data-toggle="collapse" data-parent="#CCDAAccordion" href="#collapseCCDA2_0" tabindex="1">
			          C-CDA R2.0 Validator
			        </a>
			      </h3>
			    </div>
			    <div id="collapseCCDA2_0" class="panel-collapse collapse">
			      <div class="panel-body">
			        <div id="CCDA2">
			        
	  					<div id="CCDA2wrapper">
	  						
	  						<span class="directions">Directions:</span>
	  						<ol>
	  							<li>Upload the C-CDA R2.0 document generated by your system to validate.</li>
	  							<li>Click "Validate Document".</li>
	  						</ol>
					       	
					       	<form id="CCDA2ValidationForm" action="${urlAction2_0}" method="POST" relay="<%= smartCCDAAction %>" enctype="multipart/form-data">
					      		
								<noscript><input type="hidden" name="redirect" value="true" /></noscript>
								<div id="CCDA2uploaderrorlock" style="position: relative;">
									<div class="row">
										<div class="col-md-12 form-group">
											<label for="CCDA2fileupload">Upload C-CDA file to Validate:</label><br/>
											<span class="btn btn-success fileinput-button" id="CCDA2fileupload-btn"> <i
													class="glyphicon glyphicon-plus"></i>&nbsp;<span>Upload a C-CDA File...</span>
													<input id="CCDA2fileupload" type="file" name="file"  data-parsley-maxsize2="3" data-parsley-filetype="xml" data-parsley-required data-parsley-trigger="change" data-parsley-required-message="Please slect a C-CDA file." tabindex="1"/>
											</span>
											<div id="CCDA2files"></div>
											<div id="CCDA2InfoArea" class="infoArea"></div>
										</div>
									</div>
								</div>
								<hr/>
								<button id="CCDA2formSubmit" type="submit" class="btn btn-primary start" tabindex="1">
												<i class="glyphicon glyphicon-ok"></i> <span>Validate Document</span>
								</button>
								
					      	</form>
				      	</div>
		      		</div>
			      </div>
			    </div>
			  </div>
			  
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h3 class="panel-title">
			        <a data-toggle="collapse" data-parent="#CCDAAccordion" href="#collapseReconciledValidator" tabindex="1">
			          CIRI C-CDA Validator
			        </a>
			      </h3>
			    </div>
			    <div id="collapseReconciledValidator" class="panel-collapse collapse">
			      <div class="panel-body">
			      
			      
			      	<div id="CCDAReconciled">
			      	

	  					<div id="CCDAReconciledWrapper">
					      		
					      		<span class="directions">Directions:</span>
					      		<ol>	      		
					      			<li>Download a bundle from the file picker below, which will contain a test data input file to be used as input prior to reconciliation, along with the reconciliation input. Incorporate into your system.
									
									<div id="reconciledBundleFormWrapper">
		  						
														<form id="reconciledBundleForm" action="${downloadReconciledBundleAction}" method="POST">
														
														<p>
														<noscript><input type="hidden" name="redirect" value="true"  /></noscript>
														<div id="reconciledBundleErrorlock" style="position: relative;">
															<div class="row">
															<div class="col-md-12">
															<label for="reconciledBundledLabel">Select test data and reconciliation file to download:</label><br/>
																			<div class="dropdown">
																				<button id="reconciledBundledLabel" data-toggle="dropdown"
																					class="treeButton btn btn-success dropdown-toggle" type="button" tabindex="1">
																					Pick Files <i class="glyphicon glyphicon-play"></i>
																				</button>
										
																				<ul class="dropdown-menu rightMenu" role="menu" aria-labelledby="reconciledBundledLabel" style=" overflow: scroll; /* position: absolute; */ ">
																					<li>
																						<div id="reconciledBundleFileTreePanel"></div>
																					</li>
																				</ul>
																			</div>
																			<div><span id="reconciledBundleFilePathOutput"></span></div>
															</div>
															</div>
														</div>
														<br/>
														<br/>
														<button id="reconciledBundleCCDAsubmit" type="submit"
															class="btn btn-primary start" onclick="return false;"  tabindex="1">
															<i class="glyphicon glyphicon-download"></i> <span>Download File</span>
														</button>
														<input id="reconciledBundleFilepath"
																name="reconciledBundleFilepath" type="hidden">
														</form>
													</div>
										<br/>
									</li>
									</ol>
									<form id="CCDAReconciledValidationForm" action="${urlActionReconciled}" method="POST" relay="<%= smartCCDAAction %>" enctype="multipart/form-data">
									<ol start=2>
									
										<li>Generate a C-CDA from the system which would be a combination of the test data and the reconciliation input from step 1.</li>			
										<li>Select a C-CDA Document type or MU objective  to validate your generated C-CDA after reconciliation.
										<br/>
										<br/>
											<div id="CCDAReconciled_type_radioboxgroup" class="btn-group-vertical">
							      				<label for="CCDAReconciled_type_val">Select a C-CDA Document Type or MU Stage 2 Objective:</label><br/>
								      			<site:ccdaTypesSelector id="CCDAReconciled_type_val" name="CCDAReconciled_type_val" styleClass="form-control" tabIndex="1"/> 
											</div>
										<br/>
										<br/>	
										</li>
										<li>Select the test data input file used as input prior to reconciliation.
											<br/>
											<br/>
											<noscript><input type="hidden" name="redirect" value="true" /></noscript>
											<div id="CCDAReconciledTestDataUploaderrorlock" style="position: relative;">
												<div class="row">
													<div class="col-md-12 form-group">
														<label for="CCDAReconciledTestDataFileupload">Upload Input File:</label><br/>
														<span class="btn btn-success fileinput-button" id="CCDAReconciledTestDataFileupload-btn"> <i
																class="glyphicon glyphicon-plus"></i>&nbsp;<span>Select a File...</span>
																<input id="CCDAReconciledTestDataFileupload" type="file" name="file"  data-parsley-testdatamaxsize="3" data-parsley-required data-parsley-trigger="change" data-parsley-required-message="Please select an input file." tabindex="1"/>
																
														</span>
														<div id="CCDAReconciledTestDataFiles"></div>
														<div id="CCDAReconciledTestDataInfoArea" class="infoArea"></div>
														<br/>
														<br/>
														
													</div>
												</div>
											</div>
										
										</li>
										<li>Upload C-CDA file generated post reconciliation to validate.
											<br/>
											<br/>
											<div id="CCDAReconciledReconciliationUploadErrorLock" style="position: relative;">
												<div class="row">
													<div class="col-md-12 form-group">
														<label for="CCDAReconciledReconciliationFileupload">Upload a C-CDA File:</label><br/>
														<span class="btn btn-success fileinput-button" id="CCDAReconciledReconciliationFileupload-btn"> <i
																class="glyphicon glyphicon-plus"></i>&nbsp;<span>Upload a C-CDA File...</span>
																
																<input id="CCDAReconciledReconciliationFileupload" type="file" name="ReconciliationFile"  data-parsley-reconciledmaxsize="3" data-parsley-filetype="xml" data-parsley-required data-parsley-trigger="change" data-parsley-required-message="Please select a C-CDA file." tabindex="1"/>
														</span>
														<div id="CCDAReconciliationReconciledFiles"></div>
														<div id="CCDAReconciliationReconciledInfoArea" class="infoArea"></div>
													</div>
												</div>
											</div>
											<br/>
											<br/>
										</li>
										<li>Validate.
											<br/>
											<br/>
											
											<button id="CCDAReconciledFormSubmit" type="submit" class="btn btn-primary start" tabindex="1">
												<i class="glyphicon glyphicon-ok"></i> <span>Validate Document</span>
											</button>
											
											
										</li>
					      			</ol>
					      	</form>
				      	</div>
		      		</div>
			      </div>
			    </div>
			  </div>

			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h3 class="panel-title">
			        <a data-toggle="collapse" data-parent="#CCDAAccordion" href="#collapseReferenceValidator" tabindex="1">
			          Reference C-CDA Validator
			        </a>
			      </h3>
			    </div>
			    <div id="collapseReferenceValidator" class="panel-collapse collapse">
			      <div class="panel-body">
			      
			      	<div id="CCDAReference">
			        
	  					<div id="CCDAReferenceWrapper">
	  					
	  						<span class="directions">Directions:</span>
	  							<ol>
	  								<li>Download a test data input file to be used as input for generating a C-CDA.
	  								
		  								<div id="referenceDownloadFormWrapper">
													<form id="referenceDownloadForm" action="${downloadReferenceTestDataAction}" method="POST">
													<p>
													<noscript><input type="hidden" name="redirect" value="true"  /></noscript>
													<div id="referenceDownloadErrorlock" style="position: relative;">
														<div class="row">
														<div class="col-md-12">
														<label for="referenceDownloadLabel">Select file to download:</label><br/>
																		<div class="dropdown">
																			<button id="referenceDownloadLabel" data-toggle="dropdown"
																				class="treeButton btn btn-success dropdown-toggle" type="button" tabindex="1">
																				Pick Files <i class="glyphicon glyphicon-play"></i>
																			</button>
									
																			<ul class="dropdown-menu rightMenu" role="menu" aria-labelledby="referenceDownloadLabel" style=" overflow: scroll; /* position: absolute; */ ">
																				<li>
																					<div id="referenceDownloadFileTreePanel"></div>
																				</li>
																			</ul>
																		</div>
																		<div><span id="referenceDownloadFilePathOutput"></span></div>
														</div>
														</div>
													</div>
													<!--  <hr />-->
													<br/>
													<br/>
													<button id="referenceDownloadCCDAsubmit" type="submit"
														class="btn btn-primary start" onclick="return false;"  tabindex="1">
														<i class="glyphicon glyphicon-download"></i> <span>Download File</span>
													</button>
													<input id="referenceDownloadFilepath"
														name="referenceDownloadFilepath" type="hidden">
													</form>
												<br/>
										</div>
	  								</li>
	  							</ol>
	  							
	  							
	  							<form id="CCDAReferenceValidationForm" action="${urlActionReference}" method="POST" relay="<%= smartCCDAAction %>" enctype="multipart/form-data">
	  							
	  							<ol start=2>
	  							
									<li>Generate your CCDA file and when you are ready to validate, proceed to Step 3.</li>
									<li>Select a C-CDA Document type or MU objective to validate your generated C-CDA.
										<br/>
										<br/>
											<div id="CCDAReference_type_radioboxgroup" class="btn-group-vertical">
							      			<label for="CCDAReference_type_val">Select a C-CDA Document Type or MU Stage 2 Objective:</label><br/>
							      			<site:ccdaTypesSelector id="CCDAReference_type_val" name="CCDAReference_type_val" styleClass="form-control" tabIndex="1"/> 
										</div>
										<br/>
										<br/>
									</li>
									<li>Select the input file that you used to generate the C-CDA.
									<noscript><input type="hidden" name="redirect" value="true" /></noscript>
										<div id="CCDAReferenceUploaderrorlock" style="position: relative;">
										<br/>
											<div class="row">
												<div class="col-md-12 form-group">
													<label for="CCDAReferenceFileupload">Upload Input File:</label><br/>
													<span class="btn btn-success fileinput-button" id="CCDAReferenceFileupload-btn"> <i
															class="glyphicon glyphicon-plus"></i>&nbsp;<span>Upload a File...</span>
															<input id="CCDAReferenceFileupload" type="file" name="file"  data-parsley-referencemaxsize="3" data-parsley-required data-parsley-trigger="change" data-parsley-required-message="Please select an input file." tabindex="1"/>
													</span>
													<div id="CCDAReferenceFiles"></div>
													<div id="CCDAReferenceInfoArea" class="infoArea"></div>
												</div>
											</div>
										<br/>
										<br/>
										</div>
									</li>
									<li>Upload generated C-CDA file to validate.
										<br/>
										<br/>
										<div id="CCDAReferenceCEHRTUploaderrorlock" style="position: relative;">
											
											<div class="row">
												<div class="col-md-12 form-group">
													<label for="CCDAReferenceCEHRTFileupload">Upload C-CDA File:</label><br/>
													<span class="btn btn-success fileinput-button" id="CCDAReferenceCEHRTFileupload-btn"> <i
															class="glyphicon glyphicon-plus"></i>&nbsp;<span>Upload a C-CDA File...</span>
															<input id="CCDAReferenceCEHRTFileupload" type="file" name="generatedFile"  data-parsley-generatedmaxsize="3" data-parsley-filetype="xml" data-parsley-trigger="change" data-parsley-required data-parsley-required-message="Please select a C-CDA file." tabindex="1"/>
															
													</span>
													<div id="CCDACEHRTReferenceFiles"></div>
													<div id="CCDACEHRTInfoArea" class="infoArea"></div>
													
												</div>
											</div>							
										</div>
										<br/>
										<br/>
									</li>
									<li>Validate.
										<br/>
										<br/>
											
											<button id="CCDAReferenceFormSubmit" type="submit" class="btn btn-primary start" onclick="return false;"  tabindex="1">
												<i class="glyphicon glyphicon-ok"></i> <span>Validate Document</span>
											</button>
											
										<br/>
										<br/>
									
									</li>
	  							</ol>
	  						</form>
				      </div>      	
		      		</div>
			      </div>
			    </div>
			  </div>
			  
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h3 class="panel-title">
			        <a data-toggle="collapse" data-parent="#CCDAAccordion" href="#collapseSuperValidator" tabindex="1">
			         	Super Compliant C-CDA Validator
			        </a>
			      </h3>
			    </div>
			    <div id="collapseSuperValidator" class="panel-collapse collapse">
			      <div class="panel-body">
			      
			      	
			      
			      	<div id="CCDASuper">
			        
	  					<div id="CCDASuperWrapper">
	  					
	  						<span class="directions">Directions:</span>
	  						
	  						<ol>
	  							<li>Please select a MU objective from the drop down list.</li>
								<li>Upload the CCDA file generated by your system to validate against the criteria selected in step 1.</li>
								<li>Click Validate Document.</li>
	  						</ol>
	  					
					       	<form id="CCDASuperValidationForm" action="${urlActionSuper}" method="POST" relay="<%= smartCCDAAction %>" enctype="multipart/form-data">
					      		
					      		<div id="CCDASuper_type_radioboxgroup" class="btn-group-vertical">
					      			<label for="CCDASuper_type_val">Select a C-CDA Document Type:</label><br/>
					      			<site:ccdaTypesSelector id="CCDASuper_type_val" name="CCDASuper_type_val" styleClass="form-control" tabIndex="1"/> 
								</div>
								<br/><br/>
								<noscript><input type="hidden" name="redirect" value="true" /></noscript>
								<div id="CCDASuperUploaderrorlock" style="position: relative;">
									<div class="row">
										<div class="col-md-12 form-group">
											<label for="CCDASuperFileupload">Select a C-CDA File to Validate:</label><br/>
											<span class="btn btn-success fileinput-button" id="CCDASuperFileupload-btn"> <i
													class="glyphicon glyphicon-plus"></i>&nbsp;<span>Select a C-CDA File...</span>
													<input id="CCDASuperFileupload" type="file" name="file"  data-parsley-maxsizesuper="3" data-parsley-filetype="xml" data-parsley-required data-parsley-trigger="change" data-parsley-required-message="Please slect a C-CDA file." tabindex="1"/>
											</span>
											<div id="CCDASuperFiles"></div>
											<div id="CCDASuperInfoArea" class="infoArea"></div>
										</div>
									</div>
								</div>
								<hr/>
								
								<button id="CCDASuperFormSubmit" type="submit" class="btn btn-primary start" tabindex="1">
												<i class="glyphicon glyphicon-ok"></i><span>Validate Document</span>
								</button>
								
					      	</form>
				      	</div>      	
		      		</div>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
    
    
    <div class="panel panel-default">
    	<div class="panel-heading"><h2 class="panel-title">Download C-CDAs for Incorporation</h2></div>
  			<div class="panel-body">
  			<span class="directions">Directions:</span>
      		<!--<p>Please download C-CDAs below</p>-->
      		
      		<ol>
      			<li>Download one or more of the C-CDAs provided below and use it for incorporation into your system.</li>
      			<li>Verify that your system detects the invalid sections of the C-CDA document by checking your validation routines.</li>
      		</ol>
      		
  			
  			<div class="panel-group well" id="IncorporationAccordion">
  			
			  
			  
			  
			  <div class="panel panel-default" style="overflow: visible;">
			    <div class="panel-heading">

			      <h3 class="panel-title">
			        <a data-toggle="collapse" data-parent="#IncorporationAccordion" href="#collapseReference1" tabindex="1">
			          Reference C-CDAs for Incorporation
			        </a>
			      </h3>
			    </div>
			    
			    <div id="collapseReference1" class="panel-collapse collapse" >
			      <div class="panel-body">
			        
			         <div class="tab-pane active" id="refIncorp">
			           <div id="refIncorpFormWrapper">
			          
			              <form id="refIncorpForm" action="${downloadReferenceTreeIncorporationAction}" method="POST">
			              
			              <p>
							<noscript><input type="hidden" name="redirect" value="true"  /></noscript>
							<div id="refIncorperrorlock" style="position: relative;">
								<div class="row">
								<div class="col-md-12">
								<label for="dLabel1">Select a Reference C-CDA File to Download:</label><br/>
												<div class="dropdown">
													<button id="dLabel1" data-toggle="dropdown"
														class="treeButton btn btn-success dropdown-toggle" type="button" tabindex="1">
														Pick Sample <i class="glyphicon glyphicon-play"></i>
													</button>
			
													<ul class="dropdown-menu rightMenu" role="menu" aria-labelledby="dLabel1" style=" overflow: scroll; /* position: absolute; */ ">
														<li>
															<div id="refccdafiletreepanel"></div>
														</li>
													</ul>
												</div>
												<div><span id="refIncorpfilePathOutput"></span></div>
								</div>
								</div>
							</div>
							<hr />
							<button id="refIncorpCCDAsubmit" type="submit"
								class="btn btn-primary start" onclick="return false;"  tabindex="1">
								<i class="glyphicon glyphicon-download"></i> <span>Download File</span>
							</button>
							<input id="refIncorpfilepath"
									name="refIncorpfilepath" type="hidden">
			              </form>
			           </div>
			        </div>
			      </div>
			    </div>
			  </div>
			  
			
			  <div class="panel panel-default" style="overflow: visible;">
			    <div class="panel-heading">

			      <h3 class="panel-title">
			        <a data-toggle="collapse" data-parent="#IncorporationAccordion" href="#collapseNegTestDownload" tabindex="1">
			          C-CDAs for Negative Testing
			        </a>
			      </h3>
			    </div>
			    
			    <div id="collapseNegTestDownload" class="panel-collapse collapse" >
			      <div class="panel-body">
			        
			         <div class="tab-pane active" id="negTest">
			           <div id="negTestFormWrapper">
			          
			              <form id="negTestForm" action="${downloadNegativeTestTreeIncorporationAction}" method="POST">
			              
			              <p>
							<noscript><input type="hidden" name="redirect" value="true"  /></noscript>
							<div id="negTesterrorlock" style="position: relative;">
								<div class="row">
								<div class="col-md-12">
								<label for="dLabel2">Select a C-CDA File to Download:</label><br/>
												<div class="dropdown">
													<button id="dLabel2" data-toggle="dropdown"
														class="treeButton btn btn-success dropdown-toggle" type="button" tabindex="1">
														Pick Sample <i class="glyphicon glyphicon-play"></i>
													</button>
			
													<ul class="dropdown-menu rightMenu" role="menu" aria-labelledby="dLabel2" style=" overflow: scroll; /* position: absolute; */ ">
														<li>
															<div id="negTestccdafiletreepanel"></div>
														</li>
													</ul>
												</div>
												<div><span id="negTestfilePathOutput"></span></div>
								</div>
								</div>
							</div>
							<hr />
							<button id="negTestCCDAsubmit" type="submit"
								class="btn btn-primary start" onclick="return false;"  tabindex="1">
								<i class="glyphicon glyphicon-download"></i> <span>Download File</span>
							</button>
							<input id="negTestfilepath"
									name="negTestfilepath" type="hidden">
			              </form>
			           </div>
			        </div>
			      </div>
			    </div>
			  </div>
			  
			  
			  <div class="panel panel-default" style="overflow: visible;">
			    <div class="panel-heading">
			      <h3 class="panel-title">
			        <a data-toggle="collapse" data-parent="#IncorporationAccordion" href="#collapseVendorDownload" tabindex="1">
			          Samples from Vendors for Incorporation
			        </a>
			      </h3>
			    </div>
			     
			    <div id="collapseVendorDownload" class="panel-collapse collapse" >
			      <div class="panel-body">
			      
  					<div class="tab-pane active" id="incorp">
  						<div id="incorpFormWrapper">
  						
							<form id="incorpForm" action="${downloadVendorIncorporationAction}" method="POST">
							
							<p>
							<noscript><input type="hidden" name="redirect" value="true"  /></noscript>
							<div id="incorperrorlock" style="position: relative;">
								<div class="row">
								<div class="col-md-12">
								<label for="dLabel">Select a sample C-CDA File to Download:</label><br/>
												<div class="dropdown">
													<button id="dLabel" data-toggle="dropdown"
														class="treeButton btn btn-success dropdown-toggle" type="button" tabindex="1">
														Pick Sample <i class="glyphicon glyphicon-play"></i>
													</button>
			
													<ul class="dropdown-menu rightMenu" role="menu" aria-labelledby="dLabel" style=" overflow: scroll; /* position: absolute; */ ">
														<li>
															<div id="ccdafiletreepanel"></div>
														</li>
													</ul>
												</div>
												<div><span id="incorpfilePathOutput"></span></div>
								</div>
								</div>
							</div>
							<hr />
							<button id="incorpCCDAsubmit" type="submit"
								class="btn btn-primary start" onclick="return false;"  tabindex="1">
								<i class="glyphicon glyphicon-download"></i> <span>Download File</span>
							</button>
							<input id="incorpfilepath"
									name="incorpfilepath" type="hidden">
							</form>
						</div>
  					</div>
  					
			      </div>
			    </div>
			  </div>
			</div>
			</div>
	</div>
    
 <!--<div class="panel panel-default">
    	<div class="panel-heading"><h2 class="panel-title">Downloads</h2></div>
    		<div class="panel-body">
    			<div class="col-sm-12 btn-group-vertical" style="width:100%">
      				<a class="btn btn-default" href="http://www.hl7.org/documentcenter/private/standards/cda/CDAR2_IG_IHE_CONSOL_DSTU_R1dot1_2012JUL.zip" style="width: 100%;" target="_blank" tabindex="1">Download the latest HL7 C-CDA IG</a>
      				<a class="btn btn-default" href="http://wiki.siframework.org/Companion+Guide+to+Consolidated+CDA+for+MU2" style="width: 100%;" target="_blank" tabindex="1">S&amp;I Framework C-CDA Companion Guide for MU2</a>
      				<a class="btn btn-default" href="http://ttt.transport-testing.org/ttt" style="width: 100%;" target="_blank" tabindex="1">NIST C-CDA Validator</a>
      				<a class="btn btn-default" href="http://ccda-scorecard.smartplatforms.org/static/ccdaScorecard/#/" style="width: 100%; margin-bottom: 3px;" target="_blank" tabindex="1">SMART C-CDA Scorecard</a>
      			</div>
    		</div>
    </div>
    -->
	<script type="text/javascript">
		var urlCCDA1_1 = '${urlAction1_1}';
		var urlCCDA2_0 = '${urlAction2_0}';
		var urlCCDAReconciled = '${urlActionReconciled}';
		var urlCCDAReference = '${urlActionReference}';
		var urlCCDASuper = '${urlActionSuper}';
	</script>
      	
      	
      	<div class="modal modal-wide fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" aria-hidden="true">
	      	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<ul class="nav nav-tabs" id="resultModalTabs">
					  <li><a href="#tabs-1" data-toggle="tab">Validation Result</a></li>
					  <li><a href="#tabs-2" data-toggle="tab">Original C-CDA</a></li>
					  <li><a href="#tabs-3" data-toggle="tab">Smart C-CDA Result</a></li>
					</ul>
				</div>
				<div class="modal-body">
					<div id="ValidationResult">
						<div class="tab-content" id="resultTabContent">
							<div class="tab-pane" id="tabs-1">
							</div>
							<div class="tab-pane" id="tabs-2">
							</div>
							<div class="tab-pane" id="tabs-3"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="smartCCDAValidationBtn">Smart C-CDA Validation</button>
					<button type="button" class="btn btn-primary" id="saveResultsBtn">Save Results</button>
			        <button type="button" class="btn btn-default" id="closeResultsBtn" data-dismiss="modal">Close Results</button>
				</div>
			</div>
			</div>
			</div>

			<div id="reportSaveAsQuestion" style="display: none; cursor: default">
				
				<form id="downloadtest" action="<%= downloadCCDAAction %>"
					method="POST">
					
					<label for="reportContent">Hidden field to store the report content for print or save.</label>
					<textarea id="reportContent" name="reportContent"
						style="display: none;">
      				</textarea>
					<br>
					
				</form>
			</div>


			<portlet:renderURL var="viewCaseURL">
				<portlet:param name="jspPage" value="/view2.jsp" />
			</portlet:renderURL>