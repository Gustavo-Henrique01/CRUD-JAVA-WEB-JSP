
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="pt">

<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <jsp:include page="../template/css.jsp"/>
 <jsp:include page="../template/link.jsp"/>


</head>
<style>

 html, body {

  background-color: #152733;

 }

 .container {
  display: flex;
  flex-wrap: wrap;
  gap: 2rem;
  justify-content: center;
  max-width: 100%;
 }

 .box1 {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 3rem;
  width: 100%;
  max-width: 400px;
  text-align: center;
 }
 .figuere img {
  max-width: 100%;
  height: auto;
 }

 h2 {
  font-family: "Anton", sans-serif;
  font-weight: 400;
  font-size: 3rem;
  color: white;
 }

 p {
  font-family: "Poppins", sans-serif;
  font-size: 1.2rem;
  color: white;
  margin: 0;
 }

 .main-container {
  background-color: #22333b;
  padding: 1.5rem;
  width: 100%;
  max-width: 100%;
 }


</style>
<body>
<jsp:include page="../template/nav.jsp" />

<main class="main-container" >
 <div class="box">

  <div class="container">

   <div class="box1">
    <h2>Bem-vindo ao Sistema</h2>
    <p>Faça o cadastro de Produtos facilmente</p>
   </div>

   <figure class="figure">
    <img src="https://cdn-icons-png.flaticon.com/512/5164/5164023.png"  alt="">
   </figure>
  </div>
 </div>
</main>

<jsp:include page="../template/script.jsp" />
</body>
</html>