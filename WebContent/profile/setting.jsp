<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="project" value="/Manni/profile/"/>

<c:set var="page_main" value="프로필 페이지"/>
<c:set var="page_content" value="프로필  상세페이지"/>
<c:set var="page_input" value="회 원 가 입"/>
<c:set var="page_confirm" value="아이디 중복확인"/>
<c:set var="page_confirmnickname" value="닉네임 중복확인"/>
<c:set var="page_login" value="로 그 인"/>
<c:set var="page_delete" value="회 원 탈 퇴"/>
<c:set var="page_modify" value="회원 정보 수정"/>
<c:set var="page_addInput" value="추가정보입력"/>

<c:set var="msg_list" value="프로필 리스트가 없습니다."/>

<c:set var="msg_content" value="Contributor 등급 이상부터 열람 가능합니다."/>
<c:set var="msg_input" value="회원정보를 입력해 주세요"/>
<c:set var="msg_addinput" value="추가정보를 입력해 주세요"/>
<c:set var="msg_id_x" value="는 사용할 수 없습니다"/>
<c:set var="msg_id_o" value="는 사용할 수 있습니다"/>
<c:set var="msg_login" value="회원가입에 성공했습니다 로그인해 주세요"/>
<c:set var="msg_login_main" value="님 안녕하세요"/>
<c:set var="msg_login_x" value="로그인 후 이용해주세요"/>
<c:set var="msg_grade_x" value="contributor등급 이상만 열람가능합니다."/>
<c:set var="msg_passwd" value="비밀번호를 다시 입력해 주세요"/>
<c:set var="msg_modify" value="수정할 정보를 입력하세요"/>

<c:set var="str_id" value="아이디(이메일)"/>
<c:set var="str_passwd" value="비밀번호"/>
<c:set var="str_nickName" value="닉네임"/>
<c:set var="str_joinDate" value="가입일자"/>

<c:set var="str_preferjob" value="관심직업"/>
<c:set var="str_prefercontent" value="관심컨텐츠"/>
<c:set var="str_age" value="나이"/>
<c:set var="str_gender" value="성별"/>
<c:set var="str_tel" value="전화번호"/>
<c:set var="str_resume" value="자기소개"/>
<c:set var="str_ablepjt" value="프로젝트"/>


<c:set var="btn_login" value="로그인"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_input" value="가입"/>
<c:set var="btn_main" value="메인으로"/>
<c:set var="btn_back" value="뒤로가기"/>
<c:set var="btn_input_cancel" value="가입취소"/>
<c:set var="btn_confirm" value="중복확인"/>
<c:set var="btn_ok" value="확인"/>
<c:set var="btn_ok_cancel" value="확인취소"/>
<c:set var="btn_modify" value="정보수정"/>
<c:set var="btn_delete" value="회원탈퇴"/>
<c:set var="btn_logout" value="로그아웃"/>
<c:set var="btn_del" value="탈퇴"/>
<c:set var="btn_del_cancel" value="탈퇴취소"/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정취소"/>
<c:set var="btn_addinput" value="추가정보입력"/>