<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="pt">
<style>

    html, body {
        height: 100%;
        background-color: #152733;
        overflow: auto;
    }


</style>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listagem de Produtos</title>
    <jsp:include page="../template/css.jsp"/>
    <jsp:include page="../template/link.jsp"/>

    <style>

        html, body {
            height: 100%;
            background-color: #152733;
            overflow: auto;
        }
        .main-container{

            padding: 1rem;
        }

     tr .th {
            color: #ffffff; /* Cor do texto dentro do th */
            font-size: 19px;
            padding: 15px;
            text-align: center;
        }

      tr .td {
            color: #ffffff; /* Cor do texto dentro do td */
            font-size: 15px;
            padding: 10px;
            text-align: center;
        }

        .table {


            border: 3px solid lightskyblue;

                   width: 100%;



               }

        .table-striped>tbody>tr:nth-of-type(odd) {
            background-color: lightskyblue; /* Cor de fundo para linhas ímpares */
        }

        /* Definindo a cor do texto dentro das células */
        .table-striped>tbody>tr:nth-of-type(odd)>td {
            color:  #152733; /* Cor do texto para linhas ímpares */
        }

    </style>


</head>

<body>
<jsp:include page="../template/nav.jsp" />

<main class="main-container">
    <div class="box">

        <table class="table table-striped">
            <thead>
            <tr>
                <th class="th" >Id</th>
                <th class="th">Descrição</th>
                <th class="th">Categoria</th>
                <th class="th">Preço de Custo</th>
                <th class="th">Preço de Venda</th>
                <th class="th">Quantidade</th>
                <th class="th">Data de Entrada</th>
                <th class="th">Exluir</th>
                <th class="th">Editar</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="produto" items="${produtos}">
                <tr>
                    <td class="td"><c:out value="${produto.id}" /></td>
                    <td class="td"><c:out value="${produto.descricao}" /></td>
                    <td class="td"><c:out value="${produto.categoria}" /></td>
                    <td class="td"><c:out value="${produto.preco_custo}" /></td>
                    <td class="td"><c:out value="${produto.preco_venda}" /></td>
                    <td class="td"><c:out value="${produto.quantidade}" /></td>
                    <td class="td"><fmt:formatDate value='${produto.data_entrada}' type='date' pattern='dd/MM/yyyy' /></td>
                    <td class="td">
                        <a class="btn btn-outline-danger btn-sm" onclick="return confirm('Você deseja apagar?');" href="${pageContext.request.contextPath}/controlador?acao=deletar&id=<c:out value="${produto.id}" />">Apagar</a>
                    </td>
                    <td class="td">
                        <a class="btn btn-outline-primary btn-sm"  href="${pageContext.request.contextPath}/controlador?acao=editar&id=<c:out value="${produto.id}" />">Editar</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</main>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.6.0-dist/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
<jsp:include page="../template/script.jsp" />
</body>
</html>
