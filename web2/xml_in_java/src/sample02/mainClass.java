package sample02;

import java.io.FileReader;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class mainClass {

	public static void main(String[] args)throws Exception {
		
		// client.xml java parsing
		Document xml = null;
		
		InputSource is = new InputSource(new FileReader("D:\\tmp\\client.xml"));		
		xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);

		// root element 취득
		Element element = xml.getDocumentElement();
		// System.out.println(element.getTagName());
		
		// child node들을 취득
		NodeList list = element.getChildNodes();
		// System.out.println(list.getLength());
		
		if(list.getLength() > 0) {	// child node 1개 이상
			
			for (int i = 0; i < list.getLength(); i++) {
				
				NodeList childlist = list.item(i).getChildNodes();
				
				if(childlist.getLength() > 0) {
					
					for (int j = 0; j < childlist.getLength(); j++) {
						
						if(childlist.item(j).getNodeName().equals("#text") == false) {
						
							System.out.println("xml 태그명:" + childlist.item(j).getNodeName()
									+ " xml 값:" + childlist.item(j).getTextContent());           
						}
					}
					
				}
			}			
		}		
		
	}

}




