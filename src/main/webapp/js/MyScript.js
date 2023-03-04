function doLike(pId, uId) {

	const likeData = {
		pId: pId,
		uId: uId,
		operation: 'like'
	};
	$.ajax({
		url: 'LikeServlet',
		data: likeData,
		success: function(response, textStatus, jqXHR) {
			console.log(response);
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
		}
	});
}