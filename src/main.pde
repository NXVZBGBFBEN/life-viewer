void settings() {
  size(600, 600);
}

void setup() {
  var controlFrame = new ControlFrame();
  controlFrame.setVisible(true);

  surface.setTitle("life-viewer");
}

int cellSize = 6;
int rowSize = 100;
int colSize = 100;

Field field = new Field(rowSize, colSize);

void draw() {
  background(0);
  for (int row = 0; row < rowSize; row++) {
    for (int col = 0; col < colSize; col++) {
      if (field.cells[row][col]) {
        fill(255);
      } else {
        fill(0);
      }
      rect(col * cellSize, row * cellSize, cellSize, cellSize);
    }
  }
}
