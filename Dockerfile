FROM amazonlinux:2023

ARG PYTHON_VERSION="3.12.2"

# see: https://github.com/pyenv/pyenv/wiki
RUN dnf install -y \
    gcc \
    make \
    patch \
    zlib-devel \
    bzip2 \
    bzip2-devel \
    readline-devel \
    sqlite \
    sqlite-devel \
    openssl-devel \
    tk-devel \
    libffi-devel \
    xz-devel \
    shadow-utils \
    git \
    tar && \
    dnf clean all && \
    useradd -m builder

USER builder
WORKDIR /home/builder

RUN curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' > ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    source ~/.bashrc && \
    pyenv install "$PYTHON_VERSION" && \
    pyenv local "$PYTHON_VERSION"
