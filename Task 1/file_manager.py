
# Solution 1
import os

print("Current Working Directory:", os.getcwd());

# Solution 2
path = input("Enter a path: ")

if os.path.isfile(path):
    print("It is a file.")
elif os.path.isdir(path):
    print("It is a directory.")
else:
    print("The path does not exist.")


# Solution 3
folder_name = "test_folder"

if not os.path.exists(folder_name):
    os.mkdir(folder_name)
    print(f"{folder_name} created.")
else:
    print(f"{folder_name} already exists.")



# Solution 4
print("Txt folders are listed below")
for file in os.listdir():
    if file.endswith(".txt") and os.path.isfile(file):
        print(file)
