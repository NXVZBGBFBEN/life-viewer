#!/usr/bin/env python3

import os
import shutil
import subprocess
import sys

SOURCE_DIR = os.path.abspath("./src")
BUILD_DIR = os.path.abspath("./build")
SKETCH_DIR = os.path.abspath(f"{BUILD_DIR}/life_viewer")
OUTPUT_DIR = os.path.abspath(f"{BUILD_DIR}/out")
MAIN_FILE = "main.pde"
ENTRY_FILE = "life_viewer.pde"

def dir_setup():
    if os.path.lexists(BUILD_DIR):
        shutil.rmtree(BUILD_DIR)
    shutil.copytree(SOURCE_DIR, SKETCH_DIR)
    os.rename(f"{SKETCH_DIR}/{MAIN_FILE}", f"{SKETCH_DIR}/{ENTRY_FILE}")

def print_help():
    print("HELP")

def main(argv):
    if len(argv) == 2:
        if argv[1] == "--help":
            print_help()
            result = 0
        elif argv[1] == "--build":
            dir_setup()
            result = subprocess.run(["processing-java", f"--sketch={SKETCH_DIR}", f"--output={OUTPUT_DIR}", "--build"]).returncode
        elif argv[1] == "--run":
            dir_setup()
            result = subprocess.run(["processing-java", f"--sketch={SKETCH_DIR}", f"--output={OUTPUT_DIR}", "--run"]).returncode
        elif argv[1] == "--present":
            dir_setup()
            result = subprocess.run(["processing-java", f"--sketch={SKETCH_DIR}", f"--output={OUTPUT_DIR}", "--present"]).returncode
        elif argv[1] == "--export":
            dir_setup()
            result = subprocess.run(["processing-java", f"--sketch={SKETCH_DIR}", f"--output={OUTPUT_DIR}", "--export"]).returncode
        else:
            print_help()
            result = 0
    else:
        print_help()
        result = 0
    return result

if __name__ == "__main__":
    sys.exit(main(sys.argv))
