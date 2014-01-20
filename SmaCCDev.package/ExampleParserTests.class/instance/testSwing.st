testing-java
testSwing
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