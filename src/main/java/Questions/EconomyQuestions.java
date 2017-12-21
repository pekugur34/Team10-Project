/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Questions;

import java.util.ArrayList;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


/*
 * Author:Uğur Pek
 * Created Date:08.11.2017
 * 
 * */
public class EconomyQuestions extends Domains.Domains {

    public static ArrayList<String> getJSON() throws Exception {
        String URI = getEconomyUri();

        Client client = ClientBuilder.newClient();
        WebTarget target = client.target(URI);

        String s = target.request().accept(MediaType.APPLICATION_JSON).header("apikey", "d8fafd060cd14206b23b6cf93b61689d").get(String.class);
        target.request().accept(MediaType.APPLICATION_JSON).header("apikey", "d8fafd060cd14206b23b6cf93b61689d").get(String.class);
        JSONParser parser = new JSONParser();//Parser

        Object obj = parser.parse(s);//Parsing string to json object

        JSONObject jsonObject = (JSONObject) obj;//Main json object

        JSONArray pageNews = (JSONArray) jsonObject.get("PageNews");//Page news array
        JSONObject desc = (JSONObject) pageNews.get(1);//Description part taken

        JSONObject files = (JSONObject) pageNews.get(11);//Files part taken

        JSONArray filesArr = (JSONArray) files.get("Files");//Files part is an array

        ArrayList<String> lstEverything = new ArrayList<String>();

        for (int i = 0; i < 20; i++) {
            JSONObject temp = (JSONObject) pageNews.get(i);
            JSONObject tmp = (JSONObject) filesArr.get(0);//Url of image

            lstEverything.add(temp.get("Title").toString());
            lstEverything.add(temp.get("Url").toString());
            lstEverything.add(tmp.get("FileUrl").toString());

            //lstEverything[i]=temp.get("Title").toString();
            //lstEverything[i+1]=temp.get("Url").toString();
            //lstEverything[i+2]=tmp.get("FileUrl").toString();
            //System.out.println(temp.get("Title")+""+temp.get("Url"));
            //System.out.println(tmp.get("FileUrl"));
        }

        return lstEverything;
    }

    @Override
    public String toString() {
        return "Economy Questions";
    }
}
