class Field {
  boolean[][] cells;

  Field(int rowSize, int colSize) {
    cells = new boolean[rowSize][colSize];
    for (int row = 0; row < rowSize; row++) {
      for (int col = 0; col < colSize; col++) {
        cells[row][col] = int(random(2)) == 1;
      }
    }
  }
}
