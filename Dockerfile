# The existing docker image should be deployable on binder - we just need
# to copy the content across to the $HOME directory ... see
# https://mybinder.readthedocs.io/en/latest/dockerfile.html#when-should-you-use-a-dockerfile
# for details

# SHA tagging of the publication version
FROM underworldcode/underworld2:2.6.0b

ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

# We have to do some manipulation as the root user to begin with.

RUN echo "break cache numero x"

USER root

RUN pip install mkdocs \
                mkdocs-material \
                pygments \
                pymdown-extensions

WORKDIR /home/jovyan

## These are the build templates etc


ADD docs docs
ADD jupyter-server-theme jupyter-server-theme
ADD scripts scripts
ADD mkdocs.yml mkdocs.yml
RUN ./scripts/run-sitebuilder

ADD Notebooks www/Notebooks
RUN mv /workspace/user_guide   www/Notebooks
RUN mv /workspace/publications www/Notebooks
RUN mv /workspace/tutorials    www/Notebooks

## Update the ruby dependencies and build the site


## Set config options
RUN rm -rf .jupyter || true
RUN mkdir  .jupyter
ADD jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py


# Launch the notebook server from the Notebook directory
# but perhaps there is something else that would do this.

RUN chown -R ${NB_UID} ${HOME}
USER jovyan


EXPOSE 8888
ENTRYPOINT ["/usr/local/bin/tini", "--"]

CMD scripts/run-jupyter -p 8888
