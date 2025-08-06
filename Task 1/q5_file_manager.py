import os
import shutil

# Step 1: Check/Create "reports" folder
reports_dir = "reports"

if not os.path.exists(reports_dir):
    os.mkdir(reports_dir)
    print(f"Created folder: {reports_dir}")
else:
    print(f"Folder already exists: {reports_dir}")

# Step 2: List and move .txt files
for file in os.listdir():
    if file.endswith(".txt") and os.path.isfile(file):
        print(f"Found text file: {file}")
        shutil.move(file, os.path.join(reports_dir, file))
        print(f"Moved {file} to {reports_dir}/")
