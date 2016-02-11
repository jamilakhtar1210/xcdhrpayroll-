package main.java.com.consleague;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;


/**
 * IRMarkCalculator
 * Extends MarkCalculator and provides the algorithm and main method for a GovTalk message
 */
public class IRMarkCalculator extends MarkCalculator {
	//jkdshjkhs

	
	public String getAlgorithm()
	{
		// Run a transform over the input to extract the fragment to be digested.
		// This is done by setting up a Transforms object from a Template and then 
		// executing against the input document.
		// The transforms to be performed are specified by using the template XML below.
		
	   	String transformStr =
        "<?xml version='1.0'?>\n"
      	+ "<dsig:Transforms xmlns:dsig='http://www.w3.org/2000/09/xmldsig#' xmlns:gt='http://www.govtalk.gov.uk/CM/envelope'>\n"
      	+ "<dsig:Transform Algorithm='http://www.w3.org/TR/1999/REC-xpath-19991116'>\n"
      	+ "<dsig:XPath>\n"
        + "(count(ancestor-or-self::node()|/gt:GovTalkMessage/gt:Body)=count(ancestor-or-self::node()))\n"
        + " and \n"
        + "(count(ancestor-or-self::node()|/gt:GovTalkMessage/gt:Body/*[name()='IRenvelope']/*[name()='IRheader']/*[name()='IRmark'])!=count(ancestor-or-self::node()))\n"
        + "</dsig:XPath>\n"		
      	+ "</dsig:Transform>\n"
      	+ "<dsig:Transform Algorithm='http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments'/>\n"
      	+ "</dsig:Transforms>\n"
      	;

      	return transformStr;
	}
	
	
	public String  getIRRequest(String param,String strFile)  {

		
		//File newFile = new File("E:\\HMRC\\2015-16 XML Valid Samples\\jamilEYU.xml");
		String strIRMarks=null;
		File newTextFile;
		try {
            String str = param;
            newTextFile = new File(strFile+".xml");

            FileWriter fw = new FileWriter(newTextFile);
            fw.write(str);
            fw.close();

        } catch (IOException iox) {
            //do stuff with exception
            iox.printStackTrace();
        }
		
		//
		File newFile = new File(strFile+".xml");

		FileInputStream fis = null;
		try {
			fis = new FileInputStream(newFile);
		} catch (FileNotFoundException e) {
			System.out.println("The file " + newFile + " could not be opened.");
			return null;
		}

		final MarkCalculator mc = new IRMarkCalculator();
		try {
			strIRMarks=mc.createMark(fis);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println();			
		System.out.println("IRMark for file " + newFile.getName());			
		System.out.println();
		System.out.println("       Base64 --> " + strIRMarks);
		System.out.println();
		System.out.println("============================================================");
		return strIRMarks;
	}


	/**
	 * Generate and print the mark.
	 * 
	 * @param args
	 *            1: filename of the input document
	 * @throws Exception
	 */
	public static void main(String args[]) throws Exception {

		// validate arguments
		/*
		if (args.length != 1) {
			System.out.println("Usage: IRMarkCalculator <file>");
			return;
		}
		*/

		//File newFile = new File(args[0]);
		File newFile = new File("E:\\HMRC\\2015-16 XML Valid Samples\\jamilEYU.xml");

		FileInputStream fis = null;
		try {
			fis = new FileInputStream(newFile);
		} catch (FileNotFoundException e) {
			System.out.println("The file " + newFile + " could not be opened.");
			return;
		}

		final MarkCalculator mc = new IRMarkCalculator();
		
		System.out.println();			
		System.out.println("IRMark for file " + newFile.getName());			
		System.out.println();
		System.out.println("       Base64 --> " + mc.createMark(fis));
		System.out.println();
		System.out.println("============================================================");
	}


}
