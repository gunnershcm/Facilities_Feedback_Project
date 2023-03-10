package image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class ImageDAO {

    public void insertFeedbackImages(ArrayList<ImageDTO> imagesList) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblFeedbackImages (imageURL, feedbackID) values(?, ?)";
                for (ImageDTO image : imagesList) {
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, image.getImageURL());
                    ps.setString(2, image.getFeedbackID());
                    ps.executeUpdate();
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<ImageDTO> getImagesList(String feedbackID) throws SQLException {
        List<ImageDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblFeedbackImages where feedbackID= ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, feedbackID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int imageID = rs.getInt("imageID");
                    String imageURL = rs.getString("imageURL");
                    list.add(new ImageDTO(imageID, imageURL, feedbackID));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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

    public void insertReportImages(ArrayList<ImageDTO> imagesList) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblReportImages (imageURL, reportID) values(?, ?)";
                for (ImageDTO image : imagesList) {
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, image.getImageURL());
                    ps.setString(2, image.getFeedbackID());
                    ps.executeUpdate();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public ArrayList<ImageDTO> getReportImagesList(String reportID) throws SQLException {
        ArrayList<ImageDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from tblReportImages where reportID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, reportID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int imageID = rs.getInt("imageID");
                    String imageURL = rs.getString("imageURL");
                    list.add(new ImageDTO(imageID, imageURL, reportID));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
}
