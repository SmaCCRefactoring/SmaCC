testing-java
testApplet
	JavaParser parse: '// Hello.java
import java.applet.Applet;
import java.awt.Graphics;

public class Hello extends Applet {
   public void paint(Graphics gc) {
      gc.drawString("Hello, world!", 65, 95);
   }    
}'