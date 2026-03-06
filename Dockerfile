FROM verlai/verl:vllm011.latest

WORKDIR /workspace

RUN git clone https://github.com/volcengine/verl.git
RUN cd verl && \
    git checkout v0.6.1 && \
    pip install -e .

# 2) Install rllm (editable)
RUN git clone https://github.com/rllm-org/rllm.git
RUN cd rllm && \
    pip install -e .

# 3) Install playwright
RUN pip install playwright && \
    playwright install chromium && \
    playwright install-deps

CMD ["/bin/bash"]