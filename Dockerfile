FROM ucsdets/datahub-base-notebook:2021.1-stable

USER root

COPY readdy.yml /tmp
RUN conda env create --file /tmp/readdy.yml && \
    conda run -n readdy /bin/bash -c "ipython kernel install --name=readdy"

RUN conda run -n readdy /bin/bash -c "pip install simulariumio"

USER $NB_USER
