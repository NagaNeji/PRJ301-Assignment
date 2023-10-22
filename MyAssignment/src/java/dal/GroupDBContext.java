/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class GroupDBContext extends DBContext<Group> {

    @Override
    public Group getById(String groupId) {
        try {
            String sql = "SELECT [group_id]\n"
                    + "      ,[group_name]\n"
                    + "  FROM [Group]\n"
                    + "  WHERE [group_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, groupId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                Group g = new Group();
                g.setGroupId(rs.getString("group_id"));
                g.setGroupName(rs.getString("group_name"));
                return g;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
