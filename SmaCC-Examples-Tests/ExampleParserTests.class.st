"
Contains tests exercising the example parsers
"
Class {
	#name : #ExampleParserTests,
	#superclass : #TestCase,
	#category : 'SmaCC-Examples-Tests'
}

{ #category : #'testing-java' }
ExampleParserTests >> testApplet [
	JavaParser parse: '// Hello.java
import java.applet.Applet;
import java.awt.Graphics;

public class Hello extends Applet {
   public void paint(Graphics gc) {
      gc.drawString("Hello, world!", 65, 95);
   }    
}'
]

{ #category : #'testing-c' }
ExampleParserTests >> testEcho [
	CParser parse: 'int main(int argc, char *argv[]) {
	int i;
	for (i = 0; i < argc; i++) {
		printf("%s", argv[i]);
	}
}'
]

{ #category : #'testing-c' }
ExampleParserTests >> testHello [
	CParser parse: 'main( ) {
	printf("Hello World\n");
}'
]

{ #category : #'testing-st' }
ExampleParserTests >> testSelfParsing [
	StParser parseMethod: (self class 
		sourceCodeAt: thisContext selector)
]

{ #category : #'testing-java' }
ExampleParserTests >> testServlet [
	JavaParser parse: '// Hello.java
import java.io.*;
import javax.servlet.*;

public class Hello extends GenericServlet {
    public void service(ServletRequest request, ServletResponse response) 
       throws ServletException, IOException {
       response.setContentType("text/html");
       PrintWriter pw = response.getWriter();
       pw.println("Hello, world!");
       pw.close();
    }
}'
]

{ #category : #'testing-java' }
ExampleParserTests >> testStandAlone [
	JavaParser parse: '// Hello.java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, World!"); 
    } 
}'
]

{ #category : #'testing-java' }
ExampleParserTests >> testSwing [
	JavaParser parse: '// Hello.java (Java SE 5)
import java.awt.BorderLayout;
import javax.swing.*;

public class Hello extends JFrame {
   public Hello() {
      super("hello");
      setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      setLayout(new BorderLayout());
      getContentPane().add(new JLabel("Hello, world!"));
      pack();
   }
   public static void main(String[] args) {
      new Hello().setVisible(true);
   }
}'
]

{ #category : #'testing-st' }
ExampleParserTests >> testTranscript [
	StParser parseExpression: 'Transcript show: ''Hello World''; cr'
]
