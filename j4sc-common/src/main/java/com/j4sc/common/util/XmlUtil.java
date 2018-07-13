package com.j4sc.common.util;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.Map.Entry;


import org.apache.commons.io.FileUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/15 10:21
 * @Version: 1.0
 **/
public class XmlUtil {

    public static SortedMap<String, String> dom4jXMLParse(String strXML) throws DocumentException {
        SortedMap<String, String> smap = new TreeMap<String, String>();
        Document doc = DocumentHelper.parseText(strXML);
        Element root = doc.getRootElement();
        for (Iterator iterator = root.elementIterator(); iterator.hasNext();) {
            Element e = (Element) iterator.next();
            smap.put(e.getName(), e.getText());
        }
        return smap;
    }
    /**
     * 把原始的xml转换成map key为节点的路径，值为节点值 ，遇到重复节点用”[数字]“标识第几个节点
     * 如:<xml><list><test>test1</test><test>test2</test></list></xml> 会转换成
     * /xml/list[1]/test=test1 /xml/list[2]/test=test2
     * @param message
     * @return
     */
    public static Map<String, String> xml2Map(String message) {
        Map<String, String> data = new LinkedHashMap<String, String>();
        Document doc = null;
        try {
            doc = DocumentHelper.parseText(message);
        }
        catch (DocumentException e) {
            e.printStackTrace();
        }

        Element root = doc.getRootElement();
        String path = "/" + root.getName();
        element2Map(root, data, path);
        return data;
    }

    private static void element2Map(Element ele, Map<String, String> data, String path) {
        if(ele == null) {
            return;
        }
        List<Element> childrens = ele.elements();
        if(childrens != null && childrens.size() > 0) {
            Element pre = null;
            Element cur = null;
            Element next = null;
            int nodeIndex = 1;
            int length = childrens.size();
            for (int i = 0; i < length; i++) {
                cur = childrens.get(i);
                String nodePath = path + "/" + cur.getName();
                if(pre == null) {
                    next = childrens.get(i + 1);
                    if(next.getName().equals(cur.getName())) {
                        nodePath += "[" + nodeIndex + "]";
                        nodeIndex++;
                    }
                }
                else {
                    if(pre.getName().equals(cur.getName())) {
                        nodePath += "[" + nodeIndex + "]";
                        nodeIndex++;
                    }
                    else {
                        nodeIndex = 1;
                    }
                }
                element2Map(cur, data, nodePath);
                pre = cur;
            }
        }
        else {

            data.put(path, ele.getText());

        }

    }

    /**
     * 把map转换成xml
     * @param map
     * @return
     */
    public static String map2Xml(Map<String, String> map) {
        String xml = "";
//根据map用dom4j创建Document
        Document doc = DocumentHelper.createDocument();
        Iterator<Entry<String, String>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            Entry<String, String> e = it.next();
            String key = e.getKey();
            String value = e.getValue();

            Element ele = DocumentHelper.makeElement(doc, key);
            ele.setText(value);
        }

//格式化
        OutputFormat format = OutputFormat.createPrettyPrint();
//format.setNewLineAfterDeclaration(true);
        format.setExpandEmptyElements(false);
        StringWriter out = new StringWriter();
        XMLWriter writer = new XMLWriter(out, format);
        try {
            writer.write(doc);
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        xml = out.toString();
        xml = xml.replaceAll("\\[\\d*\\]", "");
        return xml;
    }

    public static void main(String[] args) {
        File file = new File("C:/Users/zhouxuke/Desktop/test.xml");
        try {
            String message = FileUtils.readFileToString(file, "utf-8");
            Map<String, String> map = xml2Map(message);

            System.out.println(map2Xml(map));
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

}