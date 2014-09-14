/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calculator;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import javax.swing.JButton;
import javax.swing.SpringLayout;

/**
 *
 * @author RobertK
 */
public class Calculator extends Frame  implements ActionListener, WindowListener {

    TextField firstNo,secondNo,operation,answer;
    JButton button;
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Calculator frame = new Calculator();
        frame.run();
          
                }
    
    private void run()
    {
        SpringLayout layout = new SpringLayout();
        setSize(200, 250);
        setResizable(false);
        setTitle("+-*/");
        setLocationRelativeTo(null);
        setLayout(layout);
        setBackground(Color.BLUE);
        addTextField(layout);
        addButton(layout);
        setVisible(true);
        this.addWindowListener(this);
    }
    
    //a method to pass all my textfields through my displayTextfield method.
    private void addTextField(SpringLayout layout)
    {
        firstNo = displayTfield(firstNo, layout, 50, 50, 20, 100);
        operation = displayTfield(operation, layout, 50, 75, 20, 20);
        secondNo = displayTfield(secondNo, layout, 50, 100,20, 100);
        answer = displayTfield(answer, layout, 50, 150, 20, 100);
        
    }
    
    //this is a textfield, any textfield i pass through here will have the values defined in this method
    private TextField displayTfield(TextField tfield, SpringLayout fieldLayout, int x, int y, int h,int w)
    {
     tfield = new TextField();
     add(tfield);
     fieldLayout.putConstraint(SpringLayout.WEST, tfield, x, SpringLayout.WEST, this);
     fieldLayout.putConstraint(SpringLayout.NORTH, tfield, y, SpringLayout.NORTH, this);
     tfield.setPreferredSize(new Dimension( w,h));
     return tfield;
    }
    
    //adding A button to the screen
    private void addButton(SpringLayout layout)
    {
        button = new JButton("Calculate");
        add(button);
        button.addActionListener(this);
        layout.putConstraint(SpringLayout.WEST, button, 50, SpringLayout.WEST, this);
        layout.putConstraint(SpringLayout.NORTH, button, 175, SpringLayout.NORTH, this);
        button.setPreferredSize(new Dimension(100,20));   
        button.addActionListener(this);
        
    }
    //this int is what is called on button click
    int calculateAnswer (int first, String operation, int second)
    {                   //^ pram to be passed to the method ^
        int ans = 0;//< setting up new veriable called ans
        
        if ("+".equals(operation))
        {ans = first + second;}//if operation == "+" then add the numbers
        else if ("-".equals(operation))
        {ans = first - second;}//if operation == "-" then minus the numbers
        else if ("*".equals(operation))
        {ans = first * second;}//if operation == "*" then times the numbers
        else if ("/".equals(operation))
        {ans = first / second;}//if operation == "/" then devide the numbers
        
        return ans; //this statement returns the ans value, this makes the "calculateAnswer" int = ans
    }
    
    
    
      @Override//action listener
    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == button ) {
            answer.setText(Integer.toString(calculateAnswer(Integer.parseInt(firstNo.getText()), operation.getText(), Integer.parseInt(secondNo.getText()))));
            //On button click I set the text of the answer textfield to equal calculateAnswer and pass it the values from the textfields.
        }
       
    }
   
    
    
    
    
    
      
      
      
      
      // This is just window listeners to make the window close
    @Override
    public void windowClosing(WindowEvent we) {
        System.exit(0);
    }

    @Override
    public void windowIconified(WindowEvent we) {
    }

    @Override
    public void windowOpened(WindowEvent we) {
    }

    @Override
    public void windowClosed(WindowEvent we) {
    }

    @Override
    public void windowDeiconified(WindowEvent we) {
    }

    @Override
    public void windowActivated(WindowEvent we) {
    }

    @Override
    public void windowDeactivated(WindowEvent we) {
    }

  
}
