FROM ucsdets/datahub-base-notebook:2021.3-stable

USER root

ENV CONDA_PREFIX=/opt/conda/envs/readdy

COPY readdy.yml /tmp
RUN conda env create --file /tmp/readdy.yml && \
    eval "$(conda shell.bash hook)" && \
    conda activate readdy && \
    pip install jupyter && \
    python -m ipykernel install --name=readdy

RUN conda run -n readdy /bin/bash -c "pip install simulariumio"

USER $NB_USER