from os import system

if __name__ == "__main__":
    folder_name = "gcc_4.1"
    image_name = "uilianries/conangcc41"
    system("cd %s && ./build.sh" % folder_name)
    system("docker push %s" % image_name)
