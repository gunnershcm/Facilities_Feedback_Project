package utils;

import com.google.gson.Gson;
import googleuser.GoogleUserDTO;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Duy
 */
public class GoogleUtils {
    public static GoogleUserDTO getUserInfo(final String id_token) throws ClientProtocolException, IOException {
        String link = "https://oauth2.googleapis.com/tokeninfo?id_token=" + id_token;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleUserDTO user = new Gson().fromJson(response, GoogleUserDTO.class);
        return user;
    }
}
