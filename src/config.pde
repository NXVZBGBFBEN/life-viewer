import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Optional;
import java.util.Properties;

class Config {
  Properties property;

  private Path getConfigPath() {
    var XDGConfigHome = Optional.ofNullable(System.getenv("XDG_CONFIG_HOME"));
    var userHome = System.getProperty("user.home");
    var configDir = XDGConfigHome.map(XDGPath -> Path.of(XDGPath)).orElse(Path.of(userHome, ".config"));
    return configDir.resolve("life-viewer/config.xml");
  }

  Config() {
    property = new Properties();
    var configPath = getConfigPath();
    var configDir = getConfigPath().getParent();

    try {
      if (Files.exists(configPath)) {
        var inputStream = new FileInputStream(configPath.toFile());
        property.loadFromXML(inputStream);
      } else {
        if (Files.notExists(configDir)) {
          Files.createDirectories(configDir);
        }
        var outputStream = new FileOutputStream(configPath.toFile());
        property.storeToXML(outputStream, "");
        outputStream.close();
      }
    } catch (Exception e) {
      var frame = new JFrame();
      JOptionPane.showMessageDialog(frame, e);
    }
  }
}
