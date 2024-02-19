void settings() {
  size(600, 600);
}

Config config = new Config();
Field field = new Field(config.numberOfCells);
int cellSize = 600 / config.numberOfCells;

void setup() {
  var controlFrame = new ControlFrame();
  controlFrame.setVisible(true);

  surface.setTitle("life-viewer");
}

void draw() {
  background(0);
  for (int row = 0; row < config.numberOfCells; row++) {
    for (int col = 0; col < config.numberOfCells; col++) {
      if (field.cells[row][col]) {
        fill(255);
      } else {
        fill(0);
      }
      rect(col * cellSize, row * cellSize, cellSize, cellSize);
    }
  }
  delay(100);
  field.next();
}
