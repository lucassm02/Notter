package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.senai.sp.jdbc.Conexao;
import br.senai.sp.model.Usuario;

public class UsuarioDAO {
	
	private Connection con = Conexao.getConexao();
	
	public void gravar(Usuario usuario) {
		
		String sql = "insert into usuario" + "(nome, email, senha, telefone, cidade, dtNasc, sexo, salario, ativo)"
				+  "values (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getEmail());
			stm.setString(3, usuario.getSenha());
			stm.setString(4, usuario.getTelefone());
			stm.setString(5, usuario.getCidade());;
			stm.setDate(6,   usuario.getDtNasc());
			stm.setString(7, usuario.getSexo());
			stm.setDouble(8, usuario.getSalario());
			stm.setInt(9, 1);

			if (stm.execute()) {
				
			} else {
				
			}
			Conexao.fecharConexao();;
		} catch (SQLException error) {
			error.printStackTrace();
		}
	}
	
	public Usuario autenticar(String email, String senha){
		
		Usuario usuario = new Usuario();
		
		String sql = "select *from usuario"
				+ " where email = ? and senha = ? and ativo = 1";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, senha);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setSenha("");
				usuario.setCidade(rs.getString("cidade"));
				usuario.setDtNasc(rs.getDate("dtNasc"));
				usuario.setEmail(rs.getString("email"));
				usuario.setTelefone(rs.getString("telefone"));
				
				usuario.setAtivo(true);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return usuario;
	}
	
	public boolean verificarEmail(String email){
			
			Usuario usuario = new Usuario();
			
			Boolean verf;
			
			String sql = "select *from usuario"
					+ " where email = ?";
			
			try {
				PreparedStatement stm = con.prepareStatement(sql);
				stm.setString(1, email);
				
				ResultSet rs = stm.executeQuery();
				
				while(rs.next()) {
					
					usuario.setEmail(rs.getString("email"));
					
				}
					
				
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			if(usuario.getEmail() == null) {
				verf = true;
			}else {
				verf = false;
			}
			
			
			return verf;
		}
	
	public void excluir(int IdUsuario) {

		String sql = "delete from usuario" + " WHERE id = ?";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, IdUsuario);
			stm.execute();

			Conexao.fecharConexao();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
