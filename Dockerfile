FROM google/cloud-sdk
ARG podname
COPY serviceacc.json slow.sh /tmp/
RUN chmod +x /tmp/slow.sh
ENTRYPOINT ["/tmp/slow.sh > /tmp/output"]
