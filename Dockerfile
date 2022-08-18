FROM google/cloud-sdk
ENV podname nginx
COPY serviceaccount4.json slow.sh /tmp/
RUN chmod +x /tmp/slow.sh
ENTRYPOINT ["/tmp/slow.sh"]
CMD ["> /tmp/output"]
