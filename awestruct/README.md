This is a `Dockerfile` that makes using [awestruct](http://awestruct.org/)
easier. It's available as `goldmann/awestruct` from the Docker hub.

## Usage

    docker pull goldmann/awestruct

This image provides full environemnt for developing sites with awestruct. The
only thing you need to do is to mount the source of your website (or init a new
one with the `awestruct -i` command) and start hacking.

    docker run -it --rm -v /home/goldmann/git/goldmann.pl:/home/awestruct/goldmann.pl -p 4242:4242 goldmann/awestruct

## SELinux

If you run the container on a SELinux-enabled host (for example on Fedora) you
need to change the SELinux label of the directory that contains the source code
of your website to b able to modify it from inside of the container:

    chcon -t svirt_sandbox_file_t -R /home/goldmann/git/goldmann.pl/
