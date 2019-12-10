/**
 * 
 */

$(document).ready(
	function () { 
		
		//무한스크롤
		$('#autoScroll').jscroll(
			{ 
				autoTrigger: true, 
				loadingHtml: '',
				nextSelector: 'a.nextPage:last',
				padding: 300
			} 
		);

		
	}
);