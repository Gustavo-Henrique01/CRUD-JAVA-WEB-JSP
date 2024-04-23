<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 17/04/2024
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid px-0">
    <nav class="navbar navbar-expand-sm navbar-dark bg-black py-0 px-0">
        <a class="navbar-brand" href=""><img id="logo" src="https://cdn-icons-png.flaticon.com/512/5164/5164023.png"> &nbsp;&nbsp;&nbsp;</a>
        <span class="v-line"></span>
        <button class="navbar-toggler mr-3" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/controlador?acao=novoProduto">Cadastrar Produto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href= "${pageContext.request.contextPath}/controlador?acao=listar"> Listar Produto </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href= "${pageContext.request.contextPath}/controlador?acao=home"> Home </a>
                </li>

            </ul>
        </div>
    </nav>
</div>