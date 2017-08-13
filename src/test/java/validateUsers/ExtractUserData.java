package validateUsers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by artsambrano on 10/8/2017.
 */
public class ExtractUserData {

    public static List<String> getNames(List<Map<String, Object>> list) {
//        System.out.println ("***LIST FROM RESPONSE" + list);
        List<String> data = new ArrayList (list.size());
        for (Map<String, Object> map : list) {
            data.add (map.get ("id").toString ());
            data.add((String) map.get("first_name"));

        }
//        System.out.println ("***getNames method result: " + data);
        return data;

    }

}
