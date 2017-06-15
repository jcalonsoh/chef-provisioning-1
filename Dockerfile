FROM centos:latest

RUN yum update -y && yum install -y git libxml2-devel libxslt-devel nano emacs vim-enhanced curl wget \
    && wget https://packages.chef.io/files/stable/chefdk/1.1.16/el/7/chefdk-1.1.16-1.el7.x86_64.rpm \
    && yum install -y chefdk-1.1.16-1.el7.x86_64.rpm \
    && echo 'eval "$(chef shell-init bash)"' >> .bash_profile && chef gem install chef-provisioning-vsphere -v 0.10.0 \
    && rm -f chefdk-1.1.16-1.el7.x86_64.rpm

RUN chef gem install chef-provisioning -v 2.1.1

CMD ["/bin/bash"]

