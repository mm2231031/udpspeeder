FROM alpine:latest as file
MAINTAINER Gordon Mo <mo2231031@live.cn>
RUN apk add wget
RUN cd / &&  wget $(wget -qO- https://api.github.com/repos/wangyu-/UDPspeeder/releases/latest | grep "browser_download_url"  | awk -F': ' '{print $2}' | sed 's/\"/''/g') \
    && tar xvf speederv2_binaries.tar.gz

FROM scratch 
COPY --from=file /speederv2_amd64 /speederv2
ENTRYPOINT [ "/speederv2" ]
