<%@ page import="com.liferay.portal.theme.ThemeDisplay" %>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import="com.liferay.portal.kernel.servlet.ImageServletTokenUtil" %>
<%@ taglib prefix="liferay-portlet" uri="http://liferay.com/tld/portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="ua.dp.stud.studie.model.OnlineCourse" %>
<%@ page import="java.util.Collection" %>
<%@ page import="ua.dp.stud.StudPortalLib.util.ImageService" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ page isELIgnored="false" %>
<%@include file="include.jsp" %>
<%@page import="java.util.Arrays"%>

<% ImageService imageServices = (ImageService) pageContext.findAttribute("imageService"); %>


<%@ taglib prefix="theme" uri="http://liferay.com/tld/theme" %>
<%
	String[] name = (String[])request.getAttribute("names");
    Collection<OnlineCourse> courses = (Collection) request.getAttribute("onlineCourses");
%>

<html>
<head>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

</head>
<body>
<div>

<portlet:actionURL var="search" name="searchOnlineCourses"></portlet:actionURL>
          <form:form action="${search}">
                   <spring:message code="course.Search" />
  				   <input type="text" id="tags" name="title">
          </form:form>
  
  
<%if (request.isUserInRole("Administrator")){ %>
		        <portlet:renderURL var="categories">
                    <portlet:param name="view" value="onlineCoursesCategories"/>
                </portlet:renderURL>

					<select>
					    <c:forEach var="postProfile" items="${onlineCourseTypes}">
					    <option>
					        <c:out value="${postProfile.kindOfCourse}" />
					    </option>
					    </c:forEach>
					</select>		      
				 <a href="${categories}"><div style="display:inline;" id='changeBut' class="icon-pcppencil fs20" aria-hidden="true"></div></a>
		    
		       <portlet:renderURL var="LinkAddCourse">
       				 <portlet:param name="add" value="onlineCourse"/>
    		   </portlet:renderURL>
    			<div class="fs20"style="width: 10.15%;float: right;">
                		<a style="float: right" href="${LinkAddCourse}">
                    		<!--<spring:message code="viewSingle.Edit"/>-->
                    		<div class="panelbtn panelbtn-right icon-pcpplus" aria-hidden="true"></div>
                		</a>
				</div>
		    <%} %>
		    
		    <% if (!courses.isEmpty()) {
 for (OnlineCourse course : courses){%>
     <div id="newsTable" style="padding-top: 15px;float: center">
     			 <% if (request.isUserInRole("Administrator")) { %>
				         <a style="float: right"
           href="<portlet:renderURL><portlet:param name="id" value="<%=course.getId().toString()%>"/><portlet:param name="view" value="editOnlineCourse" /></portlet:renderURL>">
           <div class="icon-pcppencil fs20" aria-hidden="true"></div>
        </a>
        				<a style="float: right"
           href="<portlet:actionURL><portlet:param name="id" value="<%=course.getId().toString()%>"/><portlet:param name="view" value="deleteOnlineCourse" /></portlet:actionURL>">
           <div class="icon-pcpremove fs20" aria-hidden="true"></div>
        </a>
				<%}%>
                     <div width="100%">
                         <img src="<%= imageServices.getPathToMicroblogImage(
                        		 course.getMainImage(),
                        		 course) %>" class="newsImage" style="float: left">
 
                         <div class="newsHeader" style="padding-top: 50px; padding-left: 175px; font-size: 20pt; ">
                            <b>
                                 <a href='
                                 <portlet:renderURL>
                                     <portlet:param name="id" value="<%=course.getId().toString()%>"/>
                                         <portlet:param name="view" value="singleOnlineCourse"/>
                                 </portlet:renderURL>
                                 '><%=course.getOnlineCourseName()%>
                                 </a>
                            </b>
                            </div>
                     
           </div>
           </div>
           <br/><br/>
             <%}%>

<%}%>
     </div>

		    </body>
		    
<script>
  $(function() {
<%
StringBuffer values = new StringBuffer();
for (int i = 0; i < name.length; ++i) {
    if (values.length() > 0) {
        values.append(',');
    }
    values.append('"').append(name[i]).append('"');
}
%>
var foo = [ <%= values.toString() %> ];
    $("#tags").autocomplete({
      source: foo
    });
  });
  </script>
 </html>