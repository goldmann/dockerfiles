Docker image to run [irssi IRC client](http://www.irssi.org/)

## Building

    docker build --tag goldmann/irssi `dirname "$0"`

## Usage

    docker kill irssi
    docker rm irssi
    docker run -d --name irssi -it -m 50m -v /home/$USER/docker/irssi:/home/irssi/data goldmann/irssi

### Screen

Using screen is a convenient wayt to havea remote IRC session. The `goldmann/irssi` image can be used with `screen` in a very simple way. Start the `goldmann/irssi` image as mentioned above. Then execute this:

    screen -S irssi -p irssi -t irssi -dR

A new screen session will be created (or old reused, depends). Then attach to the irssi container with:

    docker attach irssi

Now you can easily detach from the container with `ctrl+a d`. Now it's time for magic. Add this to your `.bashrc` (or `.zshrc`) file:

    alias irssi_remote="ssh -t REMOTE_HOST screen -S irssi -p irssi -t irssi -dR"

Now, when you execute `irss_remote` command on your host, you'll connect to your remote host and attach to the running irssi!

## SELinux

If you run the container on a SELinux-enabled host (for example on Fedora) you
need to change the SELinux label of the directory that contains the configuration
to make it writable but the `irssi` process running inside of the container:

    chcon -t svirt_sandbox_file_t -R /home/$USER/docker/irssi
