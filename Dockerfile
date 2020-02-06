FROM kamcio96/alpine-docker-client:latest
COPY docker-looper.sh docker-looper.sh
ENTRYPOINT ["/bin/ash", "/docker-looper.sh"]
CMD ["busybox', "busybox"]
