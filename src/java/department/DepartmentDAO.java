package department;

import googleuser.GoogleUserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import utils.DBUtils;

public class DepartmentDAO {
    
    public ArrayList<DepartmentDTO> getListDepartment() throws SQLException{
        ArrayList<DepartmentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM tblDepartments";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    int depID = rs.getInt("depID");
                    String depName = rs.getString("depName");
                    list.add(new DepartmentDTO(depID, depName));
                }
                
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public String getDepartmentName(int depID) throws SQLException{
        String depName = "";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM tblDepartments WHERE depID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, depID);
                rs = ps.executeQuery();
                if(rs.next()){
                    depName = rs.getString("depName");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return depName;
    }

    public HashMap<DepartmentDTO, ArrayList<GoogleUserDTO>> LoadDepartmentsAndEmployees() throws SQLException {
        HashMap<DepartmentDTO, ArrayList<GoogleUserDTO>> hm = new HashMap<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM tblDepartments, tblUsers\n"
                        + "where tblUsers.depID = tblDepartments.depID";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int depID = rs.getInt("depID");
                    String depName = rs.getString("depName");
                    DepartmentDTO department = new DepartmentDTO(depID, depName);
                    String email = rs.getString("email");
                    String name = rs.getString("fullName");
                    String picture = rs.getString("picture");
                    String roleID = rs.getString("roleID");
                    GoogleUserDTO user = new GoogleUserDTO(email, name, picture, roleID, depID);
                    if (hm.containsKey(department)) {
                        hm.get(department).add(user);
                    } else {
                        ArrayList<GoogleUserDTO> list = new ArrayList<>();
                        list.add(user);
                        hm.put(department, list);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return hm;
    }
}

