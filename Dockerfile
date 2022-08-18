FROM google/cloud-sdk
ENV podname nginx
COPY serviceaccount.json slow.sh /tmp/
RUN chmod +x /tmp/slow.sh
ENTRYPOINT ["/tmp/slow.sh"]
