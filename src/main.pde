void settings() {
  size(600, 600);
}

Config config = new Config();
Field field = new Field(config.rowSize, config.colSize);

void setup() {
  var controlFrame = new ControlFrame();
  controlFrame.setVisible(true);

  surface.setTitle("life-viewer");
}

void draw() {
  background(0);
  for (int row = 0; row < config.rowSize; row++) {
    for (int col = 0; col < config.colSize; col++) {
      if (field.cells[row][col]) {
        fill(255);
      } else {
        fill(0);
      }
      rect(col * config.cellSize, row * config.cellSize, config.cellSize, config.cellSize);
    }
  }
  delay(100);
  field.next();
}
