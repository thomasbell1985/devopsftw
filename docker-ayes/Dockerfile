FROM debian@sha256:fb45fd4e25abe55a656ca69a7bef70e62099b8bb42a279a5e0ea4ae1ab410e0d as build-stage
ADD litecoin.public.key /litecoin.public.key 
RUN apt update -y && apt install -y gpg && \ 
    apt install -y wget
RUN wget https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-x86_64-linux-gnu.tar.gz
RUN wget https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-linux-signatures.asc
RUN gpg --import litecoin.public.key
RUN gpg --verify litecoin-0.18.1-linux-signatures.asc
RUN grep litecoin-0.18.1-x86_64-linux-gnu.tar.gz litecoin-0.18.1-linux-signatures.asc | sha256sum --check
RUN tar -xf litecoin-0.18.1-x86_64-linux-gnu.tar.gz
FROM debian@sha256:fb45fd4e25abe55a656ca69a7bef70e62099b8bb42a279a5e0ea4ae1ab410e0d
COPY --from=build-stage /litecoin-0.18.1/bin/litecoind /bin/litecoind
RUN chmod +x /bin/litecoind
RUN useradd litecoin
RUN mkdir /home/litecoin
RUN chown -R litecoin:litecoin /home/litecoin/
USER litecoin
ENTRYPOINT [ "litecoind" ] 


