FROM google/cloud-sdk
ENV podname testing
COPY serviceaccount.json slow.sh /tmp/
RUN chmod +x /tmp/slow.sh
ENTRYPOINT ["/tmp/slow.sh"]
