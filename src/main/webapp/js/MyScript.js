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
			if(response.trim() === 'true') {
				let noOfLikes = $('.likeCounter').html();
				noOfLikes++;
				$('.likeCounter').html(noOfLikes);
			} else {
				console.log("Some error occured")
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
		}
	});
}