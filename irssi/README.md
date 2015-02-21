Docker image to run [irssi IRC client](http://www.irssi.org/)

## Building

    docker build --tag goldmann/irssi `dirname "$0"`

## Usage

    docker kill irssi
    docker rm irssi
    docker run -d --name irssi -it -m 50m -v /home/$USER/docker/irssi:/home/irssi/data goldmann/irssi

## SELinux

If you run the container on a SELinux-enabled host (for example on Fedora) you
need to change the SELinux label of the directory that contains the configuration
to make it writable but the `irssi` process running inside of the container:

    chcon -t svirt_sandbox_file_t -R /home/$USER/docker/irssi
