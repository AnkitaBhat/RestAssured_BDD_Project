package utility;

import org.apache.log4j.Logger;

import java.io.*;
import java.util.Properties;

public class Utils{
    public static Logger logger = Logger.getLogger(Utils.class);
    public static String getProperties(String property)  {

        try{
            FileReader reader=new FileReader("src/test/resources/config.properties");
            Properties p=new Properties();
            p.load(reader);
            System.out.println(p.getProperty(property));
            property=p.getProperty(property);
          logger.info("config file called for properties");
        }
        catch(Exception err){
            System.out.println(err);
        }

        return property;

    }

    public static String getSchemaFilePath(String BASE_PATH){
        String jsonSchemaFilePath;
     
            jsonSchemaFilePath="src/test/resources/json-schema/post-schema.json";
            logger.info("post schema");
       
        return jsonSchemaFilePath;

    }
}