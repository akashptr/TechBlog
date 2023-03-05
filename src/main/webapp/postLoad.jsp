<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">
	<%
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	List<Post> posts = null;
	int catId = Integer.parseInt(request.getParameter("cId"));
	if (catId > 0) {
		posts = dao.getPostByCategory(catId);
	} else {
		posts = dao.getAllPost();
	}
	if (posts.size() == 0) {
		out.println("<h3 class='display-3 text-center'>No post in this category</h3>");
	}
	LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
	User currentUser = (User)session.getAttribute("currentUser");
	for (Post post : posts) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" src="blogPic/<%=post.getpPic()%>"
				alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title"><%=post.getpTitle()%></h5>
				<p class="card-text"><%=post.getpContent()%></p>
			</div>
			<div class="card-footer text-center secondary-background">
				<a href="#" onclick="doLike(<%= post.getPid() %>, <%= currentUser.getId() %>)" class="btn btn-outline-light btn-sm">
					<i class="fa fa-thumbs-o-up"></i>
					<span class="likeCounter"><%= likeDao.countLikeOnPost(post.getPid()) %></span>
				</a> 
				<a href="showBlogPage.jsp?pid=<%= post.getPid() %>" class="btn btn-outline-light btn-sm">Read more...</a>
				<a href="#"	class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span></a>
			</div>
		</div>
	</div>

	<%
	}
	%>
</div>