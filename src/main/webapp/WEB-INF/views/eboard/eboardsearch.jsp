<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="search_area">
	<form action="/eboardsearchComplete" method="get" id="searchForm">
		<div class="search_ctn">
			<div class="search_div1">
				<ul>
					<li class="search_li">기자 이름&이메일 : <input type="search"></li>
				</ul>
			</div>
			
			<div class="search_div2">
				<ul>
					<li class="search_li">언론사 :</li>
					<li><input type="checkbox" id="p1" name="demo-copy" value="중앙일보"/>
						<label for="p1">중앙일보</label>
						<input type="checkbox" id="p2" name="demo-copy" value="조선일보"/>
						<label for="p2">조선일보</label>
						<input type="checkbox" id="p3" name="demo-copy" value="동아일보"/>
						<label for="p3">동아일보</label>
						<input type="checkbox" id="p4" name="demo-copy" value="한겨레"/>
						<label for="p4">한겨레</label>
					</li>
				</ul>
			</div>
			
			<div class="search_div3">
			</div>
			
		</div>
	</form>
</div>