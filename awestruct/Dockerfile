FROM fedora:latest
RUN yum -y update
RUN yum -y install git bash-completion libxslt-devel libxml2-devel which patch libyaml-devel libffi-devel glibc-headers autoconf gcc-c++ glibc-devel patch readline-devel zlib-devel openssl-devel make bzip2 automake libtool bison
RUN yum clean all

RUN useradd -m awestruct

USER awestruct
WORKDIR /home/awestruct

ENV HOME /home/awestruct
ENV RUBY_VERSION 2.1.2
ENV AWESTRUCT_VERSION 0.5.5

RUN curl -sSL https://get.rvm.io | bash -s stable --ruby=$RUBY_VERSION
RUN bash -l -c "rvm use $RUBY_VERSION"
RUN bash -l -c "gem install awestruct -v $AWESTRUCT_VERSION --no-rdoc --no-ri"

EXPOSE 4242

CMD ["bash", "--login"]
