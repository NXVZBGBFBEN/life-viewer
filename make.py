#!/usr/bin/env python3

import os
import shutil
import subprocess

SOURCE_DIR = os.path.abspath("./src")
BUILD_DIR = os.path.abspath("./build")
SKETCH_DIR = os.path.abspath(f"{BUILD_DIR}/life_viewer")
OUTPUT_DIR = os.path.abspath(f"{BUILD_DIR}/out")
MAIN_FILE = "main.pde"
ENTRY_FILE = "life_viewer.pde"

if os.path.lexists(BUILD_DIR):
    shutil.rmtree(BUILD_DIR)

shutil.copytree(SOURCE_DIR, SKETCH_DIR)

os.rename(f"{SKETCH_DIR}/{MAIN_FILE}", f"{SKETCH_DIR}/{ENTRY_FILE}")

result = subprocess.run(["processing-java", f"--sketch={SKETCH_DIR}", f"--output={OUTPUT_DIR}", "--force", "--run"])
