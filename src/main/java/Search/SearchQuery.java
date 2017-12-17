package Search;

import Process.Score;
import com.sun.org.apache.xml.internal.serialize.OutputFormat;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import javax.sound.sampled.AudioFormat;
import javax.ws.rs.core.UriBuilder;

import org.springframework.web.util.UriUtils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;
import org.jsoup.select.Elements;
import sun.misc.IOUtils;


/*
 * Author:Uğur Pek
 * Created Date:13.11.2017
 * 
 * */
public final class SearchQuery extends Thread {
    //Fields

    private static final String SEARCH = "https://www.google.com/search";

    //Methods
    /*public static String[] searchQuery(String question) {//Old but Gold
		int resultNumber=10;
		String query=SEARCH+"?q="+question+"&num="+resultNumber;
		String[] searchURLs=null;
		
		try {
			Document doc=Jsoup.connect(query).userAgent("Mozilla/5.0").get();
			Elements results=doc.select("h3.r > a");
			
			searchURLs=new String[results.size()];
			int  i=0;
			for(Element result : results) {
				searchURLs[i]=result.attr("href").substring(7,result.attr("href").indexOf("&"));
				System.out.println(searchURLs[i]);
				i++;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return searchURLs;
	}*/
    public static ArrayList<String> getURLs(String question) {//Better.Takes url from 3 websites.
        int resultNumber = 4;
        String query = SEARCH + "?q=" + question + "&num=" + resultNumber;
        //
        ArrayList<String> lstURLs = new ArrayList<String>();

        try {
            Document doc = Jsoup.connect(query).userAgent("Mozilla/5.0").get();
            Elements results = doc.select("h3.r > a");
            //
            int i = 0;
            String url = "";
            for (Element el : results) {
                url = el.attr("href").substring(7, el.attr("href").indexOf("&"));
                String tempURL = decode(url);
                // String tempURL=URLDecoder.decode(url, "UTF-8");
                if (!tempURL.contains("wikipedia")) {
                    lstURLs.add(tempURL);
                }
                
                i++;
            }

        } catch (Exception e) {
            // TODO: handle exception

        } finally {
            return lstURLs;
        }

    }

    public static String decode(String url) {

        try {

            String prevURL = "";

            String decodeURL = url;

            while (!prevURL.equals(decodeURL)) {

                prevURL = decodeURL;

                decodeURL = URLDecoder.decode(decodeURL, "UTF-8");

            }

            return decodeURL;

        } catch (UnsupportedEncodingException e) {

            return "Issue while decoding" + e.getMessage();

        }

    }

    public static String getP(String question) throws MalformedURLException, IOException {
        ArrayList<String> URLsToUse = getURLs(question);
        ArrayList<String> contents = new ArrayList<String>();

        String text = "";
        for (int i = 0; i < URLsToUse.size(); i++) {

            try {

                String html = Jsoup.connect(URLsToUse.get(i)).userAgent("Mozilla/5.0").timeout(5000).get().html();
                
                Document doc = Jsoup.parse(html);
                text+=doc.select("body p").text();

            } catch (Exception ex) {
                return null;
            }
            continue;
        }

        return text;

    }

    public static String p(String question) {
        String html = "<p>An <a href='http://example.com/'><b>example</b></a> link.</p><br>sadsad</br><p>Second p</p>";
        Document doc = Jsoup.parse(html);
        String p = doc.select("body p").text();
        //String text = p.text(); // "An example link"

        return p;
    }

    public static String selectBestParagraph(String question) throws IOException {

        return "";
    }

    public static ArrayList<String> getParagraphsFromPages(String question) throws Exception {
        ArrayList<String> URLsToUse = getURLs(question);
        ArrayList<String> contents = new ArrayList<String>();

        for (String url : URLsToUse) {
            URL page = new URL(url);
            StringBuffer text = new StringBuffer();
            URLConnection connection = (URLConnection) page.openConnection();
            connection.setRequestProperty("User-Agent", "Mozilla/5.0");
            connection.connect();

            InputStreamReader in = new InputStreamReader((InputStream) connection.getContent());
            BufferedReader reader = new BufferedReader(in);

            String line;
            String cleanedLine;

            do {
                line = reader.readLine();
                text.append(line + "\n");
            } while (line != null);

            if (text != null) {
                Document doc = Jsoup.parse(text.toString());
                contents.add(doc.select("p").first().text() + "OK");
            }

        }

        return contents;
    }


    /* public static String getDataFromPages(String question) throws IOException {
		String[] URLs=getURLs(question);
		String useThisURL="";
		for(String url:URLs) {
			if(url.contains("tr.wikipedia.org")) {
			    useThisURL=URLDecoder.decode(url,"UTF-8");
				System.out.println("MY Url:"+useThisURL);
			}
		}
		
		URL page=new URL(useThisURL);
		StringBuffer text=new StringBuffer();
		HttpURLConnection conn=(HttpURLConnection) page.openConnection();
		conn.connect();//Hata veren yer burası
		
		InputStreamReader in=new InputStreamReader((InputStream)conn.getContent());
		BufferedReader reader=new BufferedReader(in);
		
		String line;
		String cleanedLine;
		
	    do {
	    	line=reader.readLine();
	    	text.append(line+"\n");
	    }while(line!=null);
		
	    Document doc=Jsoup.parse(text.toString());
	    
	    System.out.println(doc.select("p").first().text());
		
		return doc.select("p").first().text();
	}*/
    public SearchQuery() {

    }

}//end of class
