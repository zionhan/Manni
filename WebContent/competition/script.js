/**
 *	게시판 
 */

// 글쓰기
function compParListView( cNum ) {
	var url = "compParList.do?cNum="+ cNum;
	open( url, "CompParticipant", "toolbar=no, status=no, menubar=no, scrollbar=no, width=650px, height=450px" );
}












function errorAlert( msg ) {
	alert( msg );
	history.back();	
}





