<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:genericpage>
	<jsp:attribute name="head">
      <title>Sorry! something went wrong</title>
    </jsp:attribute>
	<jsp:attribute name="script">
		<script>
			$(document).ready(function() {
				console.log("Document loaded");
			});
		</script>  
    </jsp:attribute>
	<jsp:body>
        <p>Hi I'm the heart of the message</p>
    </jsp:body>
</t:genericpage>