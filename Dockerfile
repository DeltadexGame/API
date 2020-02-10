FROM crystallang/crystal

COPY . .
RUN shards install

RUN crystal build --release src/member_api.cr
ENTRYPOINT ["./member_api"]
