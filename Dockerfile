FROM dptechnology/unicore:0.0.1-pytorch1.11.0-cuda11.3

RUN apt-get update && apt-get install -y git

RUN pip install --upgrade pip
RUN pip install setuptools wheel twine networkx
RUN pip install rdkit-pypi==2021.9.5.1

WORKDIR /app
RUN git clone https://github.com/bowen-gao/DrugCLIP.git

WORKDIR /app/DrugCLIP

COPY ./data/checkpoint_best.pt /app/DrugCLIP/checkpoint_best.pt

CMD ["bash", "test.sh"]