import java.nio.file.Path;
import java.util.Optional;

class Config {
  private Path getConfigPath() {
    var XDGConfigHome = Optional.ofNullable(System.getenv("XDG_CONFIG_HOME"));
    var userHome = System.getProperty("user.home");
    var configDir = XDGConfigHome.map(XDGPath -> Path.of(XDGPath)).orElse(Path.of(userHome, ".config"));
    return configDir.resolve("config.xml");
  }

  Config() {
    println(getConfigPath());
  }
}
