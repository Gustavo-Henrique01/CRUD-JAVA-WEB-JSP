package br.edu.ifms.Dao;

import br.edu.ifms.Dao.util.Conexao;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.*;
import java.util.*;

public class Dao {
    protected String table ;
    protected  String sql = "";
    private Connection connection;

    private Connection conectar() throws SQLException {
        System.out.println("Tentando estabelecer conexão com o banco de dados...");
        if (connection == null || connection.isClosed()) {
            connection = Conexao.getConexao();
            System.out.println("Conexão estabelecida com sucesso!");
        } else {
            System.out.println("Já existe uma conexão aberta.");
        }
        return connection;
    }

    private void desconectar() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
            System.out.println("Conexão fechada com sucesso.");
        }
    }



    public void inserir(Map<String, Object> dados) throws SQLException {
        if (dados.containsKey("id")) {
            dados.remove("id");
        }
        String[] keys = dados.keySet().toArray(new String[0]);
        String fields = String.join(",", keys);
        String values = "?" + ",?".repeat(keys.length - 1);

        System.out.println(fields);
        System.out.println(values);

        String sql = "INSERT INTO " + table + " (" + fields + ") VALUES (" + values + ")";

        System.out.println(table);
        System.out.println(sql);
        try (PreparedStatement sentenca = conectar().prepareStatement(sql)) {
            int index = 1; // Índice inicial do parâmetro
            for (String key : keys) {
                Object value = dados.get(key);
                System.out.println("Setting parameter (" + key + ") with value: " + value);
                sentenca.setObject(index++, value); // Usar o índice para definir o parâmetro
            }
            int rowsAffected = sentenca.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
        } finally {
            desconectar();
        }
    }

    public <T> List<T> All(  Class<T> type) throws SQLException, NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {

        List<T> results = new ArrayList<>();


        String sql = "SELECT * FROM " + this.table +" ORDER BY id  ";


        conectar();


        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {


            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();


            while (resultSet.next()) {

                T obj = type.getDeclaredConstructor().newInstance();


                for (int i = 1; i <= columnCount; i++) {

                    String columnName = metaData.getColumnName(i);

                    Object value = resultSet.getObject(i);

                    try {

                        Field field = type.getDeclaredField(columnName);

                        field.setAccessible(true);

                        field.set(obj, value);
                    } catch (NoSuchFieldException e) {
                        System.out.println(""+e);
                    }
                }

                results.add(obj);
            }
        } finally {

            desconectar();
        }
        System.out.println(results);

        return results;
    }


    public boolean  delete ( String condicao) throws SQLException {

        String sql = String.format("DELETE  FROM "+this.table + " WHERE %s", condicao);

        conectar();

       try(  Statement statement = connection.createStatement()){

           int resultSet = statement.executeUpdate(sql);

           if(resultSet > 0 ){

               System.out.println("Registro excluído com sucesso.");
               return true;

                  }
        else {
               System.out.println("Nenhum registro foi excluído.");
               return false;

              }

       }
       catch (SQLException e ){

           System.err.println("Erro ao excluir registro: " + e.getMessage());
           return false;
       }

    }


    public void atualizar(Map<String, Object> dados, String campoCondicao, Object valorCondicao) throws SQLException {
        StringBuilder campos = new StringBuilder();
        for (Map.Entry<String, Object> entry : dados.entrySet()) {
            String chave = entry.getKey();
            Object valor = entry.getValue();

            if (!chave.equals(campoCondicao)) {
                if (campos.length() > 0) {
                    campos.append(", ");
                }
                campos.append(chave).append(" = ?");
            }
        }

        String sql = "UPDATE " + this.table + " SET " + campos.toString() + " WHERE " + campoCondicao + " = ?";
        try (PreparedStatement stm = conectar().prepareStatement(sql)) {
            int index = 1;
            for (Map.Entry<String, Object> entry : dados.entrySet()) {
                String chave = entry.getKey();
                Object valor = entry.getValue();

                if (!chave.equals(campoCondicao)) {
                    stm.setObject(index++, valor);
                }
            }
            stm.setObject(index, valorCondicao);
            stm.executeUpdate();
            System.out.println("Registro atualizado com sucesso.");
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar registro: " + e.getMessage());
        }
    }


    public <T> List<T> Allrow(  Class<T> type,String condicao) throws SQLException, NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {

        List<T> results = new ArrayList<>();


        String sql = "SELECT * FROM " + this.table +" WHERE "+condicao;


        conectar();


        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {


            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();


            while (resultSet.next()) {

                T obj = type.getDeclaredConstructor().newInstance();


                for (int i = 1; i <= columnCount; i++) {

                    String columnName = metaData.getColumnName(i);

                    Object value = resultSet.getObject(i);

                    try {

                        Field field = type.getDeclaredField(columnName);

                        field.setAccessible(true);

                        field.set(obj, value);
                    } catch (NoSuchFieldException e) {
                        System.out.println(""+e);
                    }
                }

                results.add(obj);
            }
        } finally {

            desconectar();
        }
        System.out.println(results);

        return results;
    }



}
