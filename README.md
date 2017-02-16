# Docker CentOS 5

## Docker image for Centos 5, Conan and GCC-4.1

#### About

This [image](https://hub.docker.com/r/uilianries/conangcc41/) was created to be used as build environment for gcc-4.1

#### Pull
You could the latest image by
    
    $ docker pull uilianries/conangcc41

#### Build
If you are using Conan files

    $ docker run --rm -v ${PWD}:/home/conan/project uilianries/conangcc41 /bin/bash -c "cd /home/conan/project && python build.py"

#### License
Copyright (C) 2017 Uilian Ries  

This software may be modified and distributed under the terms  
of the MIT license.  See the LICENSE file for details.
