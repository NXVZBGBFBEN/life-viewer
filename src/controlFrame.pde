import javax.swing.*;

class ControlFrame extends JFrame {
  ControlFrame() {
    setTitle("life-viewer [CONTROL]");
    setSize(400, 300);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    var menubar = new JMenuBar();

    var fileMenu = new JMenu("File");
    var configMenu = new JMenu("Config");
    menubar.add(fileMenu);
    menubar.add(configMenu);
    
    var saveItem = new JMenuItem("Save");
    fileMenu.add(saveItem);

    setJMenuBar(menubar);
  }
}
