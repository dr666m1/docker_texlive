FROM debian:10

ENV UID="5000"
ENV GID="5000"
ENV USER="app"

RUN addgroup --gid $GID app && \
    adduser --quiet app --uid $UID --gid $GID --home /home/$USER

RUN apt update && \
    apt -y install texlive-full poppler-utils poppler-data

WORKDIR /home/$USER/build

COPY . .

RUN ln -s /home/$USER/build/.latexmkrc /home/$USER/.latexmkrc && \
    chown $UID:$GID /home/$USER/build

ENV PATH=$PATH:/home/$USER/build

USER $UID

RUN latexmk sample

ENTRYPOINT ["entrypoint.sh"]
