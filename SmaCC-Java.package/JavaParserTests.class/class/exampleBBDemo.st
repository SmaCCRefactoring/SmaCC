resources
exampleBBDemo
	^ '// File: animation/bb/BBDemo.java
// Description: Illustrates animation with a ball bouncing in a box
//              Possible extensions: faster/slower button,
// Author: Fred Swartz
// Date:   February 2005 ...

import javax.swing.*;

/////////////////////////////////////////////////////////////// BBDemo
public class BBDemo extends JApplet {
    
    //============================================== applet constructor
    public BBDemo() {
        add(new BBPanel());
    }
    
    //============================================================ main
    public static void main(String[] args) {
        JFrame win = new JFrame("Bouncing Ball Demo");
        win.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        win.setContentPane(new BBPanel());
        
        win.pack();
        win.setVisible(true); 
    }
} //endclass BBDemo'