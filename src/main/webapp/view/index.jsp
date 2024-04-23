<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="pt">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cadastro de Produto</title>
    <jsp:include page="../template/css.jsp"/>
    <jsp:include page="../template/link.jsp"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');

        *, body {
            font-family: 'Poppins', sans-serif;
            font-weight: 400;
            -webkit-font-smoothing: antialiased;
            text-rendering: optimizeLegibility;
            -moz-osx-font-smoothing: grayscale;
        }

        html, body {
            height: 100%;
            background-color: #152733;
            overflow: auto;
        }


        .form-holder {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            min-height: 100vh;
        }


        .form-holder .form-content {
            position: relative;
            text-align: center;
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-align-items: center;
            align-items: center;
            padding: 60px;
        }

        .form-content .form-items {
            border: 3px solid lightskyblue;
            padding: 40px;
            display: inline-block;
            width: 100%;
            min-width: 540px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            text-align: left;
            -webkit-transition: all 0.4s ease;
            transition: all 0.4s ease;
        }

        .form-content h3 {
            color: lightblue;
            text-align: left;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .form-content h3.form-title {
            margin-bottom: 30px;
        }

        .form-content p {
            color: lightblue;
            text-align: left;
            font-size: 17px;
            font-weight: 300;
            line-height: 20px;
            margin-bottom: 30px;
        }


        .form-content label, .was-validated .form-check-input:invalid~.form-check-label, .was-validated .form-check-input:valid~.form-check-label{
            color: lightblue;
        }

        .form-content input[type=text], .form-content input[type=number], .form-content input[type=date] {
            width: 100%;
            padding: 9px 20px;
            text-align: left;
            border: 0;
            outline: 0;
            border-radius: 6px;
            background-color: #fff;
            font-size: 15px;
            font-weight: 300;
            color: #8D8D8D;
            -webkit-transition: all 0.3s ease;
            transition: all 0.3s ease;
            margin-top: 16px;
        }


        .btn-primary , .btn-secondary{
            background-color: #6C757D;
            outline: none;
            border: 0px;
            box-shadow: none;
        }

        .btn-primary:hover, .btn-primary:focus, .btn-primary:active{
            background-color: #495056;
            outline: none !important;
            border: none !important;
            box-shadow: none;
        }

        .form-content textarea {
            position: static !important;
            width: 100%;
            padding: 8px 20px;
            border-radius: 6px;
            text-align: left;
            background-color: #fff;
            border: 0;
            font-size: 15px;
            font-weight: 300;
            color: #8D8D8D;
            outline: none;
            resize: none;
            height: 120px;
            -webkit-transition: none;
            transition: none;
            margin-bottom: 14px;
        }

        .form-content textarea:hover, .form-content textarea:focus {
            border: 0;
            background-color: #ebeff8;
            color: #8D8D8D;
        }
        .a{
            text-decoration: none;
            color: #fff;
        }


    </style>

</head>

<body>

<jsp:include page="../template/nav.jsp" />

<main class="main-container">

    <c:if test="${mensagem != null}">
        <div class="alert alert-success alert-dismissible fade show">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <span><c:out value="${mensagem}" /></span>
        </div>
    </c:if>

    <div class="box">


        <div class="form-body">
            <div class="row">
                <div class="form-holder">
                    <div class="form-content">
                        <div class="form-items">
                            <h3>Cadastro de Produto</h3>

                            <form class="requires-validation" action="${pageContext.request.contextPath}/controlador?acao=save" method="POST">

                                <input class="form-control" type="hidden" id="id" name="id" value="${produtos.getId()}">
                                <div class="col-md-12">
                                    <label for="descricao">Descrição:</label>
                                    <input class="form-control" type="text" id="descricao" name="descricao" placeholder="Descrição" required value="${produtos.getDescricao()}">

                                </div>

                                <div class="col-md-12">
                                    <label for="categoria">Categoria:</label>
                                    <input class="form-control" type="text" id="categoria" name="categoria" placeholder="Categoria" required value="${produtos.getCategoria()}">

                                </div>

                                <div class="col-md-12">
                                    <label for="precoCusto">Preço de Custo:</label>
                                    <input class="form-control" type="number" id="precoCusto" name="precoCusto" placeholder="Preço de Custo" required value="${produtos.getPreco_custo()}">

                                </div>

                                <div class="col-md-12">
                                    <label for="precoVenda">Preço de Venda:</label>
                                    <input class="form-control" type="number" id="precoVenda" name="precoVenda" placeholder="Preço de Venda" required value="${produtos.getPreco_venda()}">

                                </div>

                                <div class="col-md-12">
                                    <label for="quantidade">Quantidade:</label>
                                    <input class="form-control" type="number" id="quantidade" name="quantidade" placeholder="Quantidade" required value="${produtos.getQuantidade()}">

                                </div>

                                <div class="col-md-12 mt-3">
                                    <label for="dataEntrada">Data de Entrada:</label>
                                    <input class="form-control" type="date" id="dataEntrada" name="dataEntrada" required value="${produtos.getData_entrada()}">

                                </div>

                                <div class="form-button mt-3">
                                    <button id="submit" type="submit" class="btn btn-primary">Cadastrar</button>
                                  <button class="btn btn-secondary">  <a href="${pageContext.request.contextPath}/controlador?acao=listar" class="a"> listar resultados</a> </button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</main>

<jsp:include page="../template/script.jsp" />
</body>
</html>
