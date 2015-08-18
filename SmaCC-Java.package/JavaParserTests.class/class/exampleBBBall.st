resources
exampleBBBall
	^ '// File: animation/bb/BallModel.java
// Description: The logic / model of a ball.
// Author: Fred Swartz
// Date:   February 2005

import java.awt.*;

///////////////////////////////////////////////////////////////// BallModel
public class Ball {
    //... Constants
    final static int DIAMETER = 21;
    
    //... Instance variables
    private int m_x;           // x and y coordinates upper left
    private int m_y;
    
    private int m_velocityX;   // Pixels to move each time move() is called.
    private int m_velocityY;
    
    private int m_rightBound;  // Maximum permissible x, y values.
    private int m_bottomBound;
    
    //======================================================== constructor
    public Ball(int x, int y, int velocityX, int velocityY) {
        m_x = x;
        m_y = y;
        m_velocityX = velocityX;
        m_velocityY = velocityY;
    }
    
    //======================================================== setBounds
    public void setBounds(int width, int height) {
        m_rightBound  = width  - DIAMETER;
        m_bottomBound = height - DIAMETER;
    }
    
    //============================================================== move
    public void move() {
        //... Move the ball at the give velocity.
        m_x += m_velocityX;
        m_y += m_velocityY;        
        
        //... Bounce the ball off the walls if necessary.
        if (m_x < 0) {                  // If at or beyond left side
            m_x         = 0;            // Place against edge and
            m_velocityX = -m_velocityX; // reverse direction.
            
        } else if (m_x > m_rightBound) { // If at or beyond right side
            m_x         = m_rightBound;    // Place against right edge.
            m_velocityX = -m_velocityX;  // Reverse direction.
        }
        
        if (m_y < 0) {                 // if we''re at top
            m_y       = 0;
            m_velocityY = -m_velocityY;
            
        } else if (m_y > m_bottomBound) { // if we''re at bottom
            m_y       =  m_bottomBound;
            m_velocityY = -m_velocityY;
        }
    }
    
    //============================================================== draw
    public void draw(Graphics g) {
        g.fillOval(m_x, m_y, DIAMETER, DIAMETER);
    }
    
    //============================================= getDiameter, getX, getY
    public int  getDiameter() { return DIAMETER;}
    public int  getX()        { return m_x;}
    public int  getY()        { return m_y;}
    
    //======================================================== setPosition
    public void setPosition(int x, int y) {
        m_x = x;
        m_y = y;
    }
}'