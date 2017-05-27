FROM ocaml/opam:debian

USER root

# Install OCaml toolchain
RUN opam update && \
  opam switch 4.02.3+buckle-master && \
  echo "eval `opam config env`" > /etc/profile.d/opam.sh && \
  rm -rf /home/opam/opam-repository

# Install Nodejs toolchain
RUN (curl -sL https://deb.nodesource.com/setup_6.x | bash -) && \
  apt-get install -y nodejs --no-install-recommends && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN npm install -g bs-platform@1.7.4
