package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.senai.sp.jdbc.Conexao;
import br.senai.sp.model.Compromisso;

public class CompromissoDAO {
	
	private Connection con = Conexao.getConexao();

	public void gravar(Compromisso compromisso) {
		String sql;
		sql = "insert into compromisso" + "(nome, assunto, contato, descricao, local,"
				+ "telefone, celular, data_inicio, data_fim, hora_inicio, hora_fim, prioridade, idUsuario)"
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			
			stm.setString(1, compromisso.getNome());
			stm.setString(2, compromisso.getAssunto());
			stm.setString(3, compromisso.getContato());
			stm.setString(4, compromisso.getDescricao());
			stm.setString(5, compromisso.getLocal());
			stm.setString(6, compromisso.getTelefone());
			stm.setString(7, compromisso.getCelular());
			stm.setDate(8, compromisso.getDataInicio());
			stm.setDate(9, compromisso.getDataFim());
			stm.setString(10, compromisso.getHoraInicio());
			stm.setString(11, compromisso.getHoraFim());
			stm.setString(12, compromisso.getPrioridade());
			stm.setString(13, compromisso.getIdUsuario());

			if (stm.execute()) {

			} else {

			}
			Conexao.fecharConexao();
			;
		} catch (SQLException error) {
			error.printStackTrace();
		}
	}
	
	public ArrayList<Compromisso> listacompromissos(int IdUsuario) {

		ArrayList<Compromisso> compromissos = new ArrayList<>();

		String sql = "select * from compromisso where IdUsuario = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, IdUsuario);
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {

				Compromisso compromisso = new Compromisso(); 

				compromisso.setNome(rs.getString("nome"));
				compromisso.setAssunto(rs.getString("assunto"));
				compromisso.setContato(rs.getString("contato"));
				compromisso.setDescricao(rs.getString("descricao"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setTelefone(rs.getString("telefone"));
				compromisso.setCelular(rs.getString("celular"));
				compromisso.setDataInicio(rs.getDate("data_inicio"));
				compromisso.setDataFim(rs.getDate("data_fim"));
				compromisso.setHoraInicio(rs.getString("hora_inicio"));
				compromisso.setHoraFim(rs.getString("hora_fim"));
				compromisso.setPrioridade(rs.getString("prioridade"));
				compromisso.setIdUsuario(rs.getString("idUsuario"));
				compromisso.setId(rs.getInt("id"));

				compromissos.add(compromisso);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return compromissos;

	}
	
	
	public Compromisso getCompromisso(int IdCompromisso) {

		Compromisso compromisso = new Compromisso(); 

		String sql = "select * from compromisso where id = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, IdCompromisso);
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {

				compromisso.setNome(rs.getString("nome"));
				compromisso.setAssunto(rs.getString("assunto"));
				compromisso.setContato(rs.getString("contato"));
				compromisso.setDescricao(rs.getString("descricao"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setTelefone(rs.getString("telefone"));
				compromisso.setCelular(rs.getString("celular"));
				compromisso.setDataInicio(rs.getDate("data_inicio"));
				compromisso.setDataFim(rs.getDate("data_fim"));
				compromisso.setHoraInicio(rs.getString("hora_inicio"));
				compromisso.setHoraFim(rs.getString("hora_fim"));
				compromisso.setPrioridade(rs.getString("prioridade"));
				compromisso.setIdUsuario(rs.getString("idUsuario"));
				compromisso.setId(IdCompromisso);
				

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return compromisso;

	}
	
	public ArrayList<Compromisso> listacompromissosPrioridade(int idUsuario, String prioridade) {

		ArrayList<Compromisso> compromissos = new ArrayList<>();

		String sql = "select * from compromisso where IdUsuario = ? and prioridade = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idUsuario);
			stm.setString(2, prioridade);
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {

				Compromisso compromisso = new Compromisso(); 

				compromisso.setNome(rs.getString("nome"));
				compromisso.setAssunto(rs.getString("assunto"));
				compromisso.setContato(rs.getString("contato"));
				compromisso.setDescricao(rs.getString("descricao"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setTelefone(rs.getString("telefone"));
				compromisso.setCelular(rs.getString("celular"));
				compromisso.setDataInicio(rs.getDate("data_inicio"));
				compromisso.setDataFim(rs.getDate("data_fim"));
				compromisso.setHoraInicio(rs.getString("hora_inicio"));
				compromisso.setHoraFim(rs.getString("hora_fim"));
				compromisso.setPrioridade(rs.getString("prioridade"));
				compromisso.setIdUsuario(rs.getString("idUsuario"));
				compromisso.setId(rs.getInt("id"));

				compromissos.add(compromisso);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return compromissos;

	}
	
	public void excluir(int IdCompromisso) {

		String sql = "delete from compromisso" + " WHERE id = ?";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, IdCompromisso);
			stm.execute();

			Conexao.fecharConexao();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void atualizar(Compromisso compromisso) {

		String sql;

		sql = "update compromisso" + " set nome = ?, assunto = ?, contato = ?, descricao = ?, local = ?,"
				+ "telefone = ?, celular = ?, data_inicio = ?, data_fim = ?, hora_inicio = ?, hora_fim = ?, prioridade = ? where id = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);

			stm.setString(1, compromisso.getNome());
			stm.setString(2, compromisso.getAssunto());
			stm.setString(3, compromisso.getContato());
			stm.setString(4, compromisso.getDescricao());
			stm.setString(5, compromisso.getLocal());
			stm.setString(6, compromisso.getTelefone());
			stm.setString(7, compromisso.getCelular());
			stm.setDate(8, compromisso.getDataInicio());
			stm.setDate(9, compromisso.getDataFim());
			stm.setString(10, compromisso.getHoraInicio());
			stm.setString(11, compromisso.getHoraFim());
			stm.setString(12, compromisso.getPrioridade());
			stm.setInt(13, compromisso.getId());
			

			if (stm.execute()) {

			} else {

			}
			Conexao.fecharConexao();
			;
		} catch (SQLException error) {
			error.printStackTrace();
		}
	}

}
