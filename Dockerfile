FROM debian

RUN apt-get update
RUN apt-get install wget libwww-perl -y

ENV INSTALL_DIR=/install-tl-20220506
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar xvzf install-tl-unx.tar.gz 
WORKDIR ${INSTALL_DIR}
COPY texlive.profile ${INSTALL_DIR}
RUN ["pwd" ]
RUN ["./install-tl", "--profile", "texlive.profile"]
RUN ["tlmgr", "init-usertree"]
RUN ["tlmgr", "install", "titling", "enumitem", "roboto", "fontaxes"]
