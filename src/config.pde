import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.function.Function;
import java.util.Optional;
import java.util.Properties;

class Config {
  private Properties properties;
  int numberOfCells;

  private Path getConfigPath() {
    var XDGConfigHome = Optional.ofNullable(System.getenv("XDG_CONFIG_HOME"));
    var userHome = System.getProperty("user.home");
    var configDir = XDGConfigHome.map(XDGPath -> Path.of(XDGPath)).orElse(Path.of(userHome, ".config"));
    return configDir.resolve("life-viewer/config.xml");
  }

  private <T> T loadProperty(String propertyName, T defaultValue, Function<String, T> castFunction) {
    var propertyValue = Optional.ofNullable(properties.getProperty(propertyName));
    T parsedPropertyValue;

    try {
      parsedPropertyValue = propertyValue.map(value -> castFunction.apply(value)).orElse(defaultValue);
    } catch (Exception e) {
      var frame = new JFrame();
      JOptionPane.showMessageDialog(frame, "設定ファイル内の値が不正です．\nデフォルト設定を適用します．", "Error", JOptionPane.ERROR_MESSAGE);
      parsedPropertyValue = defaultValue;
    }
    return parsedPropertyValue;
  }

  private <T> void saveProperty(String propertyName, T value, Function<T, String> castFunction) {
    properties.setProperty(propertyName, castFunction.apply(value));
  }

  private void loadAll() {
    numberOfCells = loadProperty("numberOfCells", 100, (s) -> Integer.parseInt(s));
  }

  private void saveAll() {
    saveProperty("numberOfCells", numberOfCells, (s) -> Integer.toString(s));
  }

  private void readFromFile(File configFile) {
    try {
      var inputStream = new FileInputStream(configFile);
      properties.loadFromXML(inputStream);
    } catch (Exception e) {
      var frame = new JFrame();
      JOptionPane.showMessageDialog(frame, "設定ファイルの読み込み時にエラーが発生しました．", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }

  private void writeToFile(File configFile) {
    try {
      var outputStream = new FileOutputStream(configFile);
      properties.storeToXML(outputStream, "");
      outputStream.close();
    } catch (Exception e) {
      var frame = new JFrame();
      JOptionPane.showMessageDialog(frame, "設定ファイルの書き出し時にエラーが発生しました．", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }

  Config() {
    properties = new Properties();

    var configPath = getConfigPath();

    if (Files.exists(configPath)) {
      readFromFile(configPath.toFile());
      loadAll();
      saveAll();
    } else {
      loadAll();
      saveAll();
      try {
        Files.createDirectories(configPath.getParent());
      } catch (Exception e) {
        var frame = new JFrame();
        JOptionPane.showMessageDialog(frame, "設定ファイルの保存ディレクトリ作成時にエラーが発生しました．", "Error", JOptionPane.ERROR_MESSAGE);
      }
    }
    writeToFile(configPath.toFile());
  }
}
