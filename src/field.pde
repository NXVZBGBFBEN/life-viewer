class Field {
  private int numberOfCells;
  private boolean[][] cells;
  private boolean[][] bufferedCells;

  private void next() {
    var neighbor = 0;
    for (int row = 0; row < numberOfCells; row++) {
      for (int col = 0; col < numberOfCells; col++) {
        neighbor = countNeighbor(row, col);
        if (!cells[row][col] && neighbor == 3) {
          bufferedCells[row][col] = true;
        } else if (cells[row][col]) {
          if (neighbor == 2 || neighbor == 3) {
            bufferedCells[row][col] = true;
          } else if (neighbor <= 1 || 4 <= neighbor) {
            bufferedCells[row][col] = false;
          }
        }
      }
    }
    for (int row = 0; row < numberOfCells; row++) {
        System.arraycopy(bufferedCells[row], 0, cells[row], 0, numberOfCells);
    }
  }

  private int countNeighbor(int rowPosition, int colPosition) {
    var count = 0;
    for (int rowShift = -1; rowShift <= 1; rowShift++) {
      for (int colShift = -1; colShift <= 1; colShift++) {
        if (getCellState(rowPosition + rowShift, colPosition + colShift) && !(rowShift == 0 && colShift == 0)) {
          count++;
        }
      }
    }
    return count;
  }

  private boolean getCellState(int rowPosition, int colPosition) {
    try {
      return cells[rowPosition][colPosition];
    } catch (ArrayIndexOutOfBoundsException e) {
      return false;
    }
  }

  Field(int numberOfCells) {
    this.numberOfCells = numberOfCells;
    cells = new boolean[numberOfCells][numberOfCells];
    bufferedCells = new boolean[numberOfCells][numberOfCells];
    for (int row = 0; row < numberOfCells; row++) {
      for (int col = 0; col < numberOfCells; col++) {
        cells[row][col] = int(random(2)) == 1;
      }
    }
  }
}
