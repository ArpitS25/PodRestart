FROM google/cloud-sdk
ENV podname nginx
COPY serviceacc.json slow.sh /tmp/
RUN chmod +x /tmp/slow.sh
ENTRYPOINT ["/tmp/slow.sh"]
