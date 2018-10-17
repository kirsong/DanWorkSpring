<html>
<body>
<h2>Hello World!</h2>
</body>
<%
    String contextPath=request.getContextPath();
    response.sendRedirect(contextPath+"/main");
%>
</html>
