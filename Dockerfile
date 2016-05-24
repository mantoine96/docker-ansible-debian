FROM debian:jessie

RUN apt-get update -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	acl \
	apache2 \
	asciidoc \
	bzip2 \
	cdbs \
	curl \
	debhelper \
	debianutils \
	devscripts \
	docbook-xml \
	dpkg-dev \
	fakeroot \
	gawk \
	git \
	libxml12-utils \
	locales \
	make \
	mercurial \
	mysql-server \
	openssh-client \
	openssh-server \
	python-coverage \
	python-httplib2 \
	python-jinja2 \
	python-keyczar \
	python-mock \
	python-mysqldb \
	python-node \
	python-paramiko \
	python-passlib \
	python-pip \
	python-setuptools \
	python-virtualenv \
	python-yaml \
	reprepro \
	rsync \
	ruby \
	subversion \
	sudo \
	unzip \
	xsltproc \
	zip \
	&& \
	apt-get clean

ADD init-fake.conf /etc/init/fake-container-events.conf

RUN rm /usr/sbin/policy-rc.d; \
	rm /sbin/initctl; dpkg-divert --rename --remove /sbin/initctl

RUN /usr/sbin/update-rc.d -f ondemand remove; \
	for f in \
		/etc/init/u*.conf \
		/etc/init/mounted-dev.conf \
		/etc/init/mounted-proc.conf \
		/etc/init/mounted-run.conf \
		/etc/init/mounted-tmp.conf \
		/etc/init/mounted-var.conf \
		/etc/init/hostname.conf \
		/etc/init/networking.conf \
		/etc/init/tty*.conf \
		/etc/init/plymouth*.conf \
		/etc/init/hwclock*.conf \
		/etc/init/module*.conf \
	; do \
		dpkg-divert --local --rename --add "$f"; \
	done; \
	echo '# /lib/init/fstab: cleared out for bare-bones Docker'  > /lib/init/fstab

RUN rm /etc/apt/apt.conf.d/docker-clean
RUN mkdir /etc/ansible/
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
RUN locale-gen en_US.UTF-8
RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa && \
	cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
	for key in /etc/ssh/ssh_host_*_key.pub; do echo "localhost $(cat ${key})" >> /root/.ssh/known_hosts; done
VOLUME /sys/fs/cgroup /run/lock /run /tmp
RUN pip install junit-xml
ENV container=docker
CMD ["/sbin/init"]
