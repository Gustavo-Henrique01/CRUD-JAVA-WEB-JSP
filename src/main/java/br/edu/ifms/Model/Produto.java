package br.edu.ifms.Model;

import br.edu.ifms.Dao.Dao;

import java.util.Date;

public class Produto extends Dao {

    private int id;
    private String descricao;
    private String categoria;
    private double preco_custo;
    private double preco_venda;
    private Integer quantidade;
    private Date data_entrada;

    public Produto(String descricao, String categoria, double preco_custo, double preco_venda, Integer quantidade, Date data_entrada) {
        this.descricao = descricao;
        this.categoria = categoria;
        this.preco_custo = preco_custo;
        this.preco_venda = preco_venda;
        this.quantidade = quantidade;
        this.data_entrada = data_entrada;
        this.table = "produtos";
    }

    public Produto() {
        this.table = "produtos";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getPreco_custo() {
        return preco_custo;
    }

    public void setPreco_custo(double preco_custo) {
        this.preco_custo = preco_custo;
    }

    public double getPreco_venda() {
        return preco_venda;
    }

    public void setPreco_venda(double preco_venda) {
        this.preco_venda = preco_venda;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Date getData_entrada() {
        return data_entrada;
    }

    public void setData_entrada(Date data_entrada) {
        this.data_entrada = data_entrada;
    }

    @Override
    public String toString() {
        return "Produto{" +
                "descricao='" + descricao + '\'' +
                ", categoria='" + categoria + '\'' +
                ", preco_custo=" + preco_custo +
                ", preco_venda=" + preco_venda +
                ", quantidade=" + quantidade +
                ", data_entrada=" + data_entrada +
                '}';
    }
}
