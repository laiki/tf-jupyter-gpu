 
FROM tensorflow/tensorflow:latest-gpu-jupyter

#ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y \
    build-essential python3-dev \
    python3-setuptools python3-pip \
    git
                 
RUN /usr/bin/python3 -m pip install --upgrade pip 

RUN pip install numpy scipy cython \
                pip-review autopep8 scikit-learn pandas \
                seaborn plotly matplotlib \
                imblearn imbalanced-learn \
                jupyter_http_over_ws
    #pip-review --auto
    
RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master && \
    jupyter contrib nbextension install && \
    jupyter nbextension enable scratchpad/main --sys-prefix && \
    jupyter nbextension enable varInspector/main --sys-prefix && \
    jupyter nbextension enable code_prettify/autopep8 && \
    jupyter nbextension enable execute_time/ExecuteTime &&\
    jupyter serverextension enable --py jupyter_http_over_ws

RUN git clone git://github.com/alan-turing-institute/sktime.git && \
    cd sktime && \
    pip install --editable . && \
    cd ..
    
RUN git clone https://github.com/sktime/sktime-dl.git && \
    cd sktime-dl && \
    pip install --editable . && \
    cd ..



