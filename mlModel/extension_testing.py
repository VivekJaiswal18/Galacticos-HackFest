import os

def extensionTester(path):
    file = os.listdir(path)
    extension = file[0].split('.')
    if extension[1] == 'jpg':
        return True
    else:
        return False


path = 'C:/Coding/HackFest_Galacticos/Test_Images'
print(extensionTester(path))
