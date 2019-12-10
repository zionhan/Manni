/**
 * 
 */

$(document).ready(
	function(){
		//리스트형 갱신용 에이작스
		let start = $("input[id=start]");
		let end = $("input[id=end]"); 
		let json = 
			{
				start : start.val(),
				end : end.val()
			};
		$.ajax(
				{
					type: "POST",
					url: "voteLinear.do",
					data: json,
					dataType: "json",
					success: function(data){
						let keys = Object.keys(data);
						for(let i=0; i<keys.length; i++){
							$("div[id=" + keys[i] + "]").html(data[keys[i]]);
						}
						start.remove();
						end.remove();										
					}

				}		
		);
	}
);