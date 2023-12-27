import javax.swing.*;

class ControlFrame extends JFrame {
  ControlFrame() {
    setTitle("life-viewer [CONTROL]");
    setSize(400, 300);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    var menubar = new JMenuBar();

    var fileMenu = new JMenu("File");
    menubar.add(fileMenu);
    
    var saveItem = new JMenuItem("Save");
    fileMenu.add(saveItem);

    setJMenuBar(menubar);
  }
}
