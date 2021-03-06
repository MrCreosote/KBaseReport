FROM kbase/kbase:sdkbase.latest
MAINTAINER KBase Developer
# -----------------------------------------

# Insert apt-get instructions here to install
# any required dependencies for your module.

# RUN apt-get update
RUN cpanm -i Config::IniFiles
RUN cpanm -i UUID::Random
RUN cpanm -i HTML::SimpleLinkExtor
RUN cpanm -i WWW::Mechanize --force
RUN cpanm -i MIME::Base64
RUN apt-get -y install nano

# -----------------------------------------

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R 777 /kb/module

WORKDIR /kb/module

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
