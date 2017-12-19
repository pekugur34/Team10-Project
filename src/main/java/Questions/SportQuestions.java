package Questions;

import java.util.List;

import javax.json.JsonObject;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import Domains.Domains;
import General.DomainQuestions;
import java.util.ArrayList;


/*
 * Author:Uğur Pek
 * Created Date:08.11.2017
 * 
 * */
public class SportQuestions extends Domains {

    //Methods
    public static ArrayList<String> getJSON() throws Exception {
        String URI = getSportUri();

        //
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target(URI);

        String s = target.request().accept(MediaType.APPLICATION_JSON).header("apikey", "d8fafd060cd14206b23b6cf93b61689d").get(String.class);

        JSONParser parser = new JSONParser();//Parser

        Object obj = parser.parse(s);//Parsing string to json object

        JSONObject jsonObject = (JSONObject) obj;//Main json object

        JSONArray pageNews = (JSONArray) jsonObject.get("PageNews");//Page news array
        JSONObject desc = (JSONObject) pageNews.get(1);//Description part taken

        JSONObject files = (JSONObject) pageNews.get(11);//Files part taken

        JSONArray filesArr = (JSONArray) files.get("Files");//Files part is an array

        ArrayList<String> lstEverything = new ArrayList<String>();

        for (int i = 0; i < 15; i++) {
            JSONObject temp = (JSONObject) pageNews.get(i);
            JSONObject tmp = (JSONObject) filesArr.get(0);//Url of image

            lstEverything.add(temp.get("Title").toString());
            lstEverything.add(temp.get("Url").toString());
            lstEverything.add(tmp.get("FileUrl").toString());

            //System.out.println(temp.get("Title")+""+temp.get("Url"));
            //System.out.println(tmp.get("FileUrl"));
        }

        return lstEverything;
    }

    public static void main(String[] args) {
        try {
            System.out.println(getJSON());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public String toString() {
        return "Sport Questions";
    }

}
