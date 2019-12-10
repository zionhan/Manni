/**
 * 프로필
 */

var iderror = "아이디(이메일)를 입력하세요";
var passwderror = "비밀번호를 입력하세요";
var repasswderror = "비밀번호를 같게 입력하세요";
var nicknameerror = "닉네임을 입력하세요";
var juminerror = "주민등록번호를 입력하세요";
var emailerror = "이메일 형식에 맞지 않습니다.(@를 넣어주세요)";
var confirmerror = "아이디 중복확인 해주세요";
var confirmnicknameerror = "닉네임 중복확인 해주세요";

var inputerror = "회원 가입에 실패했습니다.\n잠시 후 다시 시도하세요";
var loginiderror = "입력하신 아이디(이메일)가 없습니다.\n다시 확인하세요";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요";
var deleteerror = "회원 탈퇴에 실패했습니다.\n잠시 후 다시 시도하세요";
var modifyerror = "회원 정보 수정에 실패했습니다.\n잠시 후 다시 시도하세요";
var addinputerror = "추가정보 입력에 실패했습니다.\n잠시 후 다시 시도하세요";

var preferjoberror = "관심직업을 선택하세요.";
var prefercontenterror = "관심컨텐츠를 선택하세요.";
var ageerror = "나이를 입력하세요";
var gendererror = "성별을 선택하세요.";
var telerror1 = "전화번호를 입력하세요.";
var telerror2 = "전화번호의 양식을 확인하시고 다시 입력하세요.";
var ablepjterror = "프로젝트 가능 여부를 체크해주세요.";


function erroralert( msg ) {
	alert( msg );
	history.back();
}


// 회원 정보 수정
function modifycheck() {
	if( ! modifyform.passwd.value ) {
		alert( passwderror );
		modifyform.passwd.focus();
		return false;
	} else if( modifyform.passwd.value != modifyform.repasswd.value ) {
		alert( repasswderror );
		modifyform.repasswd.focus();
		return false;
	}
}

// 회원탈퇴
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwderror );
		passwdform.passwd.focus();
		return false;
	}
}

// 로그인
function logincheck() {
	if( ! loginform.id.value ) {
		alert( iderror );
		loginform.id.focus();
		return false;
	} else if( ! loginform.passwd.value ) {
		alert( passwderror );
		loginform.passwd.focus();
		return false;
	}		
}

// 아이디 중복확인
function confirmid() {
	if( ! inputform.id.value ) {
		alert( iderror );
		inputform.id.focus();		
	} else if( inputform.id.value.indexOf( "@" ) == -1 ) {
		alert( emailerror );
		inputform.id.focus();
		return false;
	} else {
		var url = "userConfirmId.do?id=" + inputform.id.value;
		open( url, "Confirm", "toolbar=no,menubar=no,scrollbar=no,status=no,width=600,height=200" );		
	}
}

//닉네임 중복확인
function confirmnickname() {
	if( ! inputform.nickName.value ) {
		alert( nicknameerror );
		inputform.nickName.focus();		
	} else {
		var url = "userConfirmNickName.do?nickName=" + inputform.nickName.value;
		open( url, "Confirm", "toolbar=no,menubar=no,scrollbar=no,status=no,width=400,height=200" );		
	}
}
function confirmcheck() {
	if( ! confirmform.id.value ) {
		alert( iderror );
		confirmform.id.focus();
		return false;
	} else if( confirmform.id.value.indexOf( "@" ) == -1 ) {
		alert( emailerror );
		inputform.id.focus();
		return false;
	} 
}
function confirmnicknamecheck() {
	if( ! confirmform.nickName.value ){
		alert( nicknameerror );
		confirmform.nickName.focus();
		return false;
	}
}

function setid( id ) {
	opener.document.inputform.confirm.value = "1";		// 중복확인 성공
	opener.document.inputform.id.value = id;
	self.close();
}

function setnickname( nickName ) {
	opener.document.inputform.confirmNickName.value = "1";
	opener.document.inputform.nickName.value = nickName;
	self.close();
}

// 메인 페이지 
function maincheck() {
	if( ! mainform.id.value ) {
		alert( iderror );
		mainform.id.focus();
		return false;
	} else if( ! mainform.passwd.value ) {
		alert( passwderror );
		mainform.passwd.focus();
		return false;
	}
}

// 회원가입
function inputcheck() {
	if( inputform.confirm.value == "0" ) {
		alert( confirmerror );
		inputform.id.focus();
		return false;
	}
	if( inputform.confirmNickName.value == "0" ) {
		alert( confirmnicknameerror );
		inputform.nickName.focus();
		return false;
	}
	if( ! inputform.id.value ) {
		alert( iderror );
		inputform.id.focus();
		return false;
	} else if( ! inputform.passwd.value ) {
		alert( passwderror );
		inputform.passwd.focus();
		return false;
	} else if( inputform.passwd.value != inputform.repasswd.value ) {
		alert( repasswderror );
		inputform.repasswd.focus();
		return false;
	} else if( ! inputform.nickname.value ) {
		alert( nicknameerror );
		inputform.nickname.focus();
		return false;
	} 	
} 

function addinputcheck() {
	
	let preferJobChecked = false;
	let genderChecked = false;
	let ablePjtChecked = false;
	let preferContentChecked = false;
	
	
	if( ! addinputform.age.value ) {
		alert( ageerror );
		addinputform.age.focus();
		return false;
	} else if( addinputform.tel1.value 
			|| addinputform.tel2.value 
			|| addinputform.tel3.value ) {
		if( addinputform.tel1.value.length < 3 
				|| addinputform.tel2.value.length < 3
				|| addinputform.tel3.value.length < 4 ) {
			alert( telerror2 );
			addinputform.tel1.focus();
			return false;
		}		
	} else if( !addinputform.tel1.value 
			|| !addinputform.tel2.value 
			|| !addinputform.tel3.value) {
		alert(telerror1);
		return false;
	}
	
	for(var k=0; k<addinputform.preferJob.length; k++){
		if(addinputform.preferJob[k].checked){
			preferJobChecked = true;
		}
	}
	if( preferJobChecked ){
			
	}else{
		alert(preferjoberror);
		return false;
	}
	for(var i=0; i<addinputform.preferContent.length; i++) {
		if(addinputform.preferContent[i].checked) {
			preferContentChecked = true;
		}
	}
	if( preferContentChecked ) {
		
	} else {
		alert( prefercontenterror );
		return false;
	}
	for(var j=0; j<addinputform.gender.length; j++){
		if(addinputform.gender[j].checked){
			genderChecked = true;
		}
	}
	if( genderChecked ){
	
	}else {
		alert(gendererror);
		return false;
	}
	for(var i=0; i<addinputform.ablePjt.length; i++){
		if(addinputform.ablePjt[i].checked){
			ablePjtChecked = true;
		}
	} if( ablePjtChecked ){
		
	}else {
		alert(ablepjterror);
		return false;
	}
}


function nexttel2() {
	if( addinputform.tel1.value.length == 3 ) {
		addinputform.tel2.focus();
	}
}
function nexttel3() {
	if( addinputform.tel2.value.length == 4 ) {
		addinputform.tel3.focus();
	}
}

function nextresume() {
	if( addinputform.tel3.value.length == 4 ) {
		addinputform.resume.focus();
	}
}
















