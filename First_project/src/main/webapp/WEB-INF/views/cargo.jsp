<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="custom" uri="/WEB-INF/tags/implicit.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"	crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"	crossorigin="anonymous"></script>
<title>Cargos</title>
<style type="text/css">
	.page-item.active .page-link {
	    color: #fff;
	    background-color: #343a40;
	    border-color: #343a40;
	}
	.page-link:focus{
	    color: #fff;
	    text-decoration: none;
	    background-color: #343a40;
	    border-color: #ddd;
	}
	.page-link:hover {
	 	color: #fff;
	    text-decoration: none;
	    background-color: #343a40;
	    border-color: #ddd;
	}
	.page-link {
	    position: relative;
	    display: block;
	    padding: .5rem .75rem;
	    margin-left: -1px;
	    line-height: 1.25;
	    color: #343a40;
	    background-color: #fff;
	    border: 1px solid #ddd;
	}
	.dropdown-item.active, .dropdown-item:active {
	    color: #fff;
	    text-decoration: none;
	    background-color: #343a40;
	 }
	.btn-outline-warning {
	    background-color: #fff;
	}
	.table-striped > tbody > tr:nth-child(n) > th {
  		 background-color: #343a40!important;
  		 color: #ffffff;
	}
	.table{
		margin-top: 10px;
		padding-left: 0;
		padding-right: 0;
	}
	.left{
		margin-top: 20px;
		padding-right: 0;
		text-align: center;
	}
	.top{
		margin-top: 60px;
	}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="/">MySite</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavButton">
			<span class="navbar-toggler-icon"></span>
		</button>
			<div class="navbar-collapse collapse justify-content-stretch" id="navbarNav">
				<ul class="nav navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="/">Home<span class="sr-only">(current)</span></a>
					</li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item">
							<a class="nav-link" href="/admin">Admin</a>
						</li>
				   </sec:authorize>
					<li class="nav-item">
						<a class="nav-link active" href="/cargo">Cargos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/owner">Owners</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/transporter">Transporters</a>
					</li>
				</ul>
			     <sec:authorize access="isAnonymous()">
				    	 <ul class="navbar-nav ml-auto">
				    		<li class="nav-item active"><a class="nav-link" href="/login">Login</a></li>
							<li class="nav-item active"><a class="nav-link" href="/registration">Sign Up</a></li>
						</ul>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						 <ul class="navbar-nav ml-auto">
							<li class="nav-item active">
								<a class="nav-link" href="/profile">Profile</a>
							</li>
				    		<li>
					    		<form:form action="/logout" class="navbar-nav ml-auto">
					    			<button class="btn btn-light">Logout</button>
					    		</form:form>
				    		</li>
				    	</ul>
	      			</sec:authorize>
			</div>
	</div>
</nav>
	<div class="container-fluid">
		<div class="row top">
			<div class="col-6"></div>
			<div class="col-6 text-right">
				<custom:size posibleSizes="5,10,15,20" size="${cargos.size}" />
			</div>
		</div>
	<div class="row">
		<div class="col-2 left">
			<form:form action="/cargo" modelAttribute="cargoFilter" method="GET">
				<div class="form-group row">
					<div class=" col">
  						<form:checkboxes items="${goodses}" path="goodsIds" element="div"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-6 pl-2 pr-0">
						<form:input path="minWeight" class="form-control pl-2" placeholder="Min weight"/>
					</div>
					<div class="col-6 pl-0 pr-0">
						<form:input path="maxWeight" class="form-control pl-2" placeholder="Max weight"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-6 pl-2 pr-0">
						<form:input path="minHeight" class="form-control pl-2" placeholder="Min height"/>
					</div>
					<div class="col-6 pl-0 pr-0">
						<form:input path="maxHeight" class="form-control pl-2" placeholder="Max height"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-6 pl-2 pr-0">
						<form:input path="minWidth" class="form-control pl-2" placeholder="Min width"/>
					</div>
					<div class="col-6 pl-0 pr-0">
						<form:input path="maxWidth" class="form-control pl-2" placeholder="Max height"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-6 pl-2 pr-0">
						<form:input path="minLength" class="form-control pl-2" placeholder="Min length"/>
					</div>
					<div class="col-6 pl-0 pr-0">
						<form:input path="maxLength" class="form-control pl-2" placeholder="Max length"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col">
					  	<form:checkboxes items="${cities}" path="cityFrom" element="div"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col">
						<form:checkboxes items="${cities}" path="cityTo" element="div"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-6 pl-2 pr-0">
						<form:input path="minPrice" class="form-control pl-2" placeholder="Min price"/>
					</div>
					<div class="col-6 pl-0 pr-0">
						<form:input path="maxPrice" class="form-control pl-2" placeholder="Max price"/>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-12">
        				<button type="submit" class="btn btn-dark btn-lg btn-block">Search</button>
      				</div>
				</div>
			</form:form>
		</div>
			<div class="col-10 pl-4">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="text-center">Goods</th>
						<th class="text-center">Weight</th>
						<th class="text-center">Height</th>
						<th class="text-center">Width</th>
						<th class="text-center">Length</th>
						<th class="text-center">City from</th>
						<th class="text-center">City to</th>
						<th class="text-center">Price</th>
						<th class="text-center">Creation date</th>
						<sec:authorize access="hasRole('ROLE_TRANSPORTER')">
							<th class="text-center">Options</th>
						</sec:authorize>
					</tr>
					<c:forEach var="cargo" items="${cargos.content}">
					<tr>
						<td class="text-center">${cargo.goods}</td>
						<td class="text-center">${cargo.weight}</td>
						<td class="text-center">${cargo.height}</td>
						<td class="text-center">${cargo.width}</td>
						<td class="text-center">${cargo.length}</td>
						<td class="text-center">${cargo.cityFrom}</td>
						<td class="text-center">${cargo.cityTo}</td>
						<td class="text-center">${cargo.price}</td>
						<td class="text-center">${cargo.creationDate}</td>
						<sec:authorize access="hasRole('ROLE_TRANSPORTER')">
							<td class= "text-center">
								<a href="/cargo/${cargo.id}" class="btn btn-dark btn-sm">Info</a>
							</td>
						</sec:authorize>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<custom:pageable page="${cargos}"/>
			</div>
		</div>
	</div>
</body>
</html>