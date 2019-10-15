package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.senai.sp.jdbc.Conexao;
import br.senai.sp.model.Contato;

public class ContatoDAO {

	private Connection con = Conexao.getConexao();

	public void gravar(Contato contato) {
		String sql;
		sql = "insert into contato" + "(nome, email, telefone, celular, logradouro,"
				+ "bairro, cidade, estado, cep, pessoa, contato, dtNasc, idUsuario)"
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?);";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getEmail());
			stm.setString(3, contato.getTelefone());
			stm.setString(4, contato.getCelular());
			stm.setString(5, contato.getLogradouro());
			stm.setString(6, contato.getBairro());
			stm.setString(7, contato.getCidade());
			stm.setString(8, contato.getEstado());
			stm.setString(9, contato.getCep());
			stm.setString(10, contato.getPessoa());
			stm.setString(11, contato.getContato());
			stm.setDate(12, contato.getDtNasc());
			stm.setInt(13, contato.getIdUsuario());

			if (stm.execute()) {

			} else {

			}
			Conexao.fecharConexao();
			;
		} catch (SQLException error) {
			error.printStackTrace();
		}
	}

	public ArrayList<Contato> listacontatos(int IdUsuario) {

		ArrayList<Contato> contato = new ArrayList<>();

		String sql = "select * from contato where IdUsuario = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, IdUsuario);
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {

				Contato contatos = new Contato();

				contatos.setId(rs.getString("id"));
				contatos.setNome(rs.getString("nome"));
				contatos.setEmail(rs.getString("email"));
				contatos.setBairro(rs.getString("bairro"));
				contatos.setCelular(rs.getString("celular"));
				contatos.setCep(rs.getString("cep"));
				contatos.setCidade(rs.getString("cidade"));
				contatos.setContato(rs.getString("contato"));
				contatos.setDtNasc(rs.getDate("dtNasc"));
				contatos.setEstado(rs.getString("estado"));
				contatos.setIdUsuario(rs.getInt("idUsuario"));
				contatos.setLogradouro(rs.getString("logradouro"));
				contatos.setPessoa(rs.getString("pessoa"));
				contatos.setTelefone(rs.getString("telefone"));

				contato.add(contatos);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return contato;

	}

	public Contato getContato(int IdContato) {

		Contato contatos = new Contato();

		String sql = "select * from contato where id = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, IdContato);
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {

				contatos.setId(rs.getString("id"));
				contatos.setNome(rs.getString("nome"));
				contatos.setEmail(rs.getString("email"));
				contatos.setBairro(rs.getString("bairro"));
				contatos.setCelular(rs.getString("celular"));
				contatos.setCep(rs.getString("cep"));
				contatos.setCidade(rs.getString("cidade"));
				contatos.setContato(rs.getString("contato"));
				contatos.setDtNasc(rs.getDate("dtNasc"));
				contatos.setEstado(rs.getString("estado"));
				contatos.setIdUsuario(rs.getInt("idUsuario"));
				contatos.setLogradouro(rs.getString("logradouro"));
				contatos.setPessoa(rs.getString("pessoa"));
				contatos.setTelefone(rs.getString("telefone"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return contatos;

	}

	public void excluir(int IdContato) {

		String sql = "delete from contato" + " WHERE id = ?";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, IdContato);
			stm.execute();

			Conexao.fecharConexao();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void atualizar(Contato contato) {

		String sql;

		sql = "update contato" + " set nome = ?, email = ?, telefone = ?, celular = ?, logradouro = ?,"
				+ "bairro = ?, cidade = ?, estado = ?, cep = ?, pessoa = ?, contato = ?, dtNasc = ? where id = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);

			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getEmail());
			stm.setString(3, contato.getTelefone());
			stm.setString(4, contato.getCelular());
			stm.setString(5, contato.getLogradouro());
			stm.setString(6, contato.getBairro());
			stm.setString(7, contato.getCidade());
			stm.setString(8, contato.getEstado());
			stm.setString(9, contato.getCep());
			stm.setString(10, contato.getPessoa());
			stm.setString(11, contato.getContato());
			stm.setDate(12, contato.getDtNasc());
			stm.setString(13, contato.getId());

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
