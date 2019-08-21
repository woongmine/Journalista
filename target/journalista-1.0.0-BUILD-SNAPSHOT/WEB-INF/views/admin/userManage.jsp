<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	

<script>
	function checkAll() {
		if ($("#th_checkAll").is(':checked')) {
			$("input[name=checkRow]").prop("checked", true);
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}

	function memberDelete() {

	    // 사용자 ID를 갖고 온다.
	    var m_noArray = [];
	 
	    // name이 같은 체크박스의 값들을 배열에 담는다.
	    
	    $("input[name='checkRow']:checked").each(function(i) {
	        m_noArray.push($(this).val());
	    });
	     
	    // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
	    var allData = { "m_noArray": m_noArray };

		$.ajax({
			url : "memberDelete",
			type : "post",
			data : allData,
			/* dataType : "text", */
			success : function(data) {
				console.log(m_noArray+", 회원삭제완료");
				alert("회원삭제완료");
				location.reload();
			},
			error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);

	        }
		});

	}
</script>

<body>
	<table class="table" style="width: 50%" align="center" id="maintable">
		<thead class="thead-dark">
			<tr>
				<th scope="col"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></th>
				<th scope="col">회원번호</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">권한상태</th>
				<th scope="col">이메일 인증 상태</th>
				<th scope="col">수정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allmember}" var="member">
				<c:set var="email_key" value="${member.email_key}"/>
				<c:set var="m_no" value="${member.m_no}"/>
				<tr scope="col">
					<td><input type="checkbox" name="checkRow" value="${member.m_no}"></td>
					<td>${m_no}</td>
					<td>${member.name}</td>
					<td>${member.email}</td>
					<td>${member.auth}</td>
					<td>
						<c:choose>
							<c:when test="${ email_key eq 'Y' }">
							인증 완료
							</c:when>
							<c:otherwise>
							비인증 상태
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<form action="updateView">
							<button type="submit" name="m_no" value="${m_no}" class="btn btn-secondary btn-sm">수정</button>
						</form>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7" align="right">
					<div class="btn-group" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-secondary">수정</button>
						<button type="submit" class="btn btn-secondary" id="memberDelete" onclick="memberDelete();">삭제</button>
						<button type="button" class="btn btn-secondary">신규</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</body>