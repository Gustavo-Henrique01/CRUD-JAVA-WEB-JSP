package br.edu.ifms.Controller;

import br.edu.ifms.Model.Produto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;
import java.sql.SQLException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/controlador")
public class ProdutoController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processarRequisicao(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processarRequisicao(request, response);
    }

    public void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");
        if (acao != null && !acao.isEmpty()) {
            switch (acao) {
                case "save":
                    salvar(request, response);
                    break;
                case "listar":
                    listar(request, response);
                    break;
                case "deletar":
                    try {
                        deletarProduto(request, response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "novoProduto":
                    novoProduto(request, response);
                    break;
                case "home":
                   home(request, response);
                    break;

                case "editar":
                    try {
                        editar(request, response);
                    } catch (SQLException | NoSuchMethodException | InstantiationException | IllegalAccessException | InvocationTargetException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                    default:

                    break;
            }
        } else {

            home(request, response);
        }
    }

    protected void home (HttpServletRequest request ,HttpServletResponse response ) throws ServletException, IOException{

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/inicio.jsp");
        dispatcher.forward(request, response);


    }

    protected void novoProduto (HttpServletRequest request ,HttpServletResponse response ) throws ServletException, IOException{

        String descricao = "";
        String categoria = "";
        double preco_custo = 0.0;
        double preco_venda = 0.0;
        int quantidade = 0;
        Date data_entrada = null;


        Produto produto = new Produto(descricao,categoria,preco_custo,preco_venda,quantidade,data_entrada);
        produto.setId(0);
        System.out.println(produto);
        request.setAttribute("produtos",produto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/index.jsp");
        dispatcher.forward(request, response);


    }

    protected void salvar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int  id = Integer.parseInt(request.getParameter("id"));
        String descricao = request.getParameter("descricao");
        String categoria = request.getParameter("categoria");
        double precoCusto = Double.parseDouble(request.getParameter("precoCusto"));
        double precoVenda = Double.parseDouble(request.getParameter("precoVenda"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        Date dataEntrada = Date.valueOf(request.getParameter("dataEntrada"));

        Map<String, Object> dadosProduto = new HashMap<>();
        dadosProduto.put("descricao", descricao);
        dadosProduto.put("categoria", categoria);
        dadosProduto.put("preco_custo", precoCusto);
        dadosProduto.put("preco_venda", precoVenda);
        dadosProduto.put("quantidade", quantidade);
        dadosProduto.put("data_entrada", dataEntrada);

        Produto produtoDao = new Produto();

        try {

            if(id < 1){
                produtoDao.inserir(dadosProduto);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/index.jsp");
                request.setAttribute("mensagem", "Produto cadastrado com sucesso");
                dispatcher.forward(request, response);
            }
            else{
                String ID =request.getParameter("id");
                produtoDao.atualizar(dadosProduto,"id", id);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/index.jsp");
                request.setAttribute("mensagem", "Produto cadastrado atualizado com sucesso");
                dispatcher.forward(request, response);

            }

        } catch (SQLException e) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/index.jsp");
            request.setAttribute("mensagem", "Erro ao cadastrar produto: " + e.getMessage());
            dispatcher.forward(request, response);
        }


    }

    protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Produto produtoDao = new Produto();


            List<Produto> produtos = produtoDao.All(Produto.class);
            if (produtos != null && !produtos.isEmpty()) {

                request.setAttribute("produtos", produtos);
                System.out.println("deu certo - Listagem de produtos concluída com sucesso!");
            } else {
                System.out.println("deu ruim - A lista de produtos está vazia!");

            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/listagem.jsp");


            dispatcher.forward(request, response);

        } catch (SQLException | NoSuchMethodException | InvocationTargetException | InstantiationException |
                 IllegalAccessException e) {

            System.out.println("deu ruim - Erro ao listar produtos: " + e.getMessage());
        }
    }

        protected void deletarProduto (HttpServletRequest request, HttpServletResponse response) throws ServletException,  SQLException {

        try {
        String parametro = (request.getParameter("id"));

        Produto produtos =  new Produto();

        produtos.delete(  "id="+ parametro);
        String path = request.getContextPath() + request.getServletPath() + "?acao=listar";
        response.sendRedirect(path);


        } catch (IOException  |  SQLException e) {
            System.out.println("deu ruim - Erro ao deletar produto: " + e.getMessage());
        }

    }

    protected void editar (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, NoSuchMethodException, InstantiationException, IllegalAccessException, InvocationTargetException {
        String idParametro = request.getParameter("id");
        if (idParametro != null && !idParametro.isEmpty()) {
            int id = Integer.parseInt(idParametro);

            Produto produtoDao = new Produto();
            List<Produto> produto = produtoDao.Allrow(Produto.class, "id=" + id);

            if (!produto.isEmpty()) {
                Produto produtos = produto.get(0);
                System.out.println(produtos);
                request.setAttribute("produtos", produtos);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/index.jsp");
                dispatcher.forward(request, response);
            } else {
                // Produto não encontrado
                response.sendRedirect(request.getContextPath() + "/controlador?acao=listar");
            }
        } else {
            // ID inválido ou não fornecido
            response.sendRedirect(request.getContextPath() + "/controlador?acao=listar");
        }
    }





}
