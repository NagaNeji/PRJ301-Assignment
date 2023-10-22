/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class AccountDBContext extends DBContext<Account> {

    public Account get(Account entity) {

        try {
            String sql = "SELECT [username]\n"
                    + "      ,[password]\n"
                    + "      ,[displayname]\n"
                    + "      ,[student_id]\n"
                    + "      ,[campus_id]\n"
                    + "  FROM [Account]\n"
                    + "WHERE username = ? AND [password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getUsername());
            stm.setString(2, entity.getPassword());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setDisplayName(rs.getString("displayname"));
                account.setStudentId(rs.getString("student_id"));
                account.setCampusId(rs.getString("campus_id"));
                return account;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    @Override
    public Account getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
